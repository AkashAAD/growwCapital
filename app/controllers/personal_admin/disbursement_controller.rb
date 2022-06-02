module PersonalAdmin 
  class DisbursementController < ApplicationController
    before_action :get_disbursment, only: [:edit, :show, :destroy, :update]
    before_action :get_channel_partner, only: [:create, :update]
    before_action :check_sales_manager, only: [:create, :new, :destroy]
    before_action :authenticate_user!
    before_action :check_admin_manager
    layout 'personal_admin'

    def index
      if current_user&.sales_manager?
        @disbursements = Disbursement.all.where('payment_date >= ? OR payment_date is null', 1.day.ago)
      else
        @disbursements = Disbursement.all
      end

      search_disbursements
      @disbursements = @disbursements.order(id: :desc).paginate(page: params[:page], per_page: 10)
      # @channel_partners = ChannelPartner.all.pluck(:code, :code)
      @corrdinators = User.joins(:role).where('roles.name = ? || roles.name = ?', 'sales_manager', 'admin').map {|rr| [rr.full_name, rr.id] }
      @products = Product.all.pluck(:name, :slug)
    end

    def new
      @disbursement = Disbursement.new
    end

    def create
      @disbursement = Disbursement.new(set_params)
      @disbursement.user = current_user

      if @disbursement.save
        flash[:notice] = 'New disbursement created successfully.'
        redirect_to sales_manager_disbursements_path
      else
        flash[:error] = @disbursement.errors.full_messages.join(', ')
        render :new
      end
    end

    def update
      redirect_to sales_manager_disbursements_path if @disbursement.payment

      @disbursement.user = current_user
      @disbursement.payment = params[:disbursement][:payment] ? true : false

      if @disbursement.update(set_params)
        set_payment

        flash[:notice] = 'Disbursement updated successfully.'
        redirect_to sales_manager_disbursements_path
      else
        flash[:error] = @disbursement.errors.full_messages.join(', ')
        render :edit
      end
    end

    def edit
      redirect_to sales_manager_disbursements_path if @disbursement.payment
    end

    def show; end

    def destroy
      @disbursement.destroy
      flash[:notice] = 'Disbursement deleted successfully.'
      redirect_to sales_manager_disbursements_path
    end

    def channel_partner_name
      render json: { name: channel_partner(params[:code])&.full_name }
    end

    private

    def set_params
      params.require(:disbursement).permit(
        :login_entry_id,
        :processing_fee,
        :bank_insurance,
        :disburse_amount,
        :disburse_date,
        :bt_inhancement,
        :cc_apply,
        :insurance,
        :roi,
        :remark
      )
    end

    def get_disbursment
      @disbursement = Disbursement.find_by!(id: params[:id])
    end

    def get_channel_partner
      @channel_partner = channel_partner(params[:disbursement][:channel_partner_id])
    end

    def channel_partner(code)
      ChannelPartner.find_by(code: code)
    end

    def set_payment
      if @disbursement.payment
        @disbursement.payment_date = Time.zone.now
        @disbursement.login_entry.payment_date = @disbursement.payment_date
      end

      @disbursement.save

      @disbursement.login_entry.payment = @disbursement.payment
      @disbursement.login_entry.save
    end

    def search_disbursements
      if params[:search].present?
        key = "%#{params[:search]}%"
        columns = Disbursement.column_names
        @disbursements = @disbursements.where(
          columns.map { |c| "#{c} like :search" }.join(' OR '),
          search: key
        )
      end

      if params[:from_date].present? && params[:to_date].present?
        if params[:from_date]&.to_date < params[:to_date]&.to_date
          @disbursements = @disbursements.where(created_at: params[:from_date].to_date..params[:to_date].to_date)
        else
          return flash[:warning] = 'From date should be less than to date.'
        end
      end

      if params[:channel_partner_code].present?
        @disbursements = @disbursements.joins([login_entry: :channel_partner])
        @disbursements = @disbursements.where('channel_partners.code = ?', params[:channel_partner_code])
      end

      if params[:product_name].present?
        @disbursements = @disbursements.where('login_entries.product_name = ?', params[:product_name])
      end

      if params[:cordinator].present?
        @disbursements = @disbursements.where(user_id: params[:cordinator])
      end

      @total_disburse_amount = @disbursements.sum(:disburse_amount)
    end
  end
end
