module PersonalAdmin 
  class DisbursementController < ApplicationController
    before_action :get_disbursment, only: [:edit, :show, :destroy, :update]
    before_action :get_channel_partner, only: [:create, :update]
    before_action :authenticate_user!
    before_action :check_sales_manager
    layout 'personal_admin'

    def index
      @disbursements = Disbursement.all.where('created_at >= ?', 3.days.ago)
      @disbursements = search_disbursements(params[:search]) if params[:search].present?
      @disbursements = @disbursements.paginate(page: params[:page], per_page: 10)
    end

    def new
      @disbursement = Disbursement.new
    end

    def create
      @disbursement = Disbursement.new(set_params)
      @disbursement.channel_partner = @channel_partner

      if @disbursement.save
        flash[:notice] = 'New disbursement created successfully.'
        redirect_to sales_manager_disbursements_path
      else
        flash[:error] = @disbursement.errors.full_messages.join(', ')
        render :new
      end
    end

    def update
      set_params[:channel_partner_id] = @channel_partner&.id

      if @disbursement.update(set_params)
        flash[:notice] = 'Disbursement updated successfully.'
        redirect_to sales_manager_disbursements_path
      else
        flash[:error] = @disbursement.errors.full_messages.join(', ')
        render :edit
      end
    end

    def edit; end

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
      params.require(:disbursement).permit!
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

    def search_disbursements(search)
      key = "%#{search}%"
      columns = Disbursement.column_names
      return Disbursement.where(
        columns.map { |c| "#{c} like :search" }.join(' OR '),
        search: key
      )
    end
  end
end
