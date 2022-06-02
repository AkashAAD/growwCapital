module PersonalAdmin
  class LoginEntryController < ApplicationController
    before_action :get_login_entry, only: [:edit, :show, :destroy, :update]
    before_action :check_sales_manager, only: [:create, :new, :destroy, :edit, :update]
    before_action :authenticate_user!
    before_action :check_admin_manager
    layout 'personal_admin'

    def index
      if current_user&.sales_manager?
        @login_entries = LoginEntry.all.where('payment_date >= ? OR payment_date is null', 1.day.ago)
      else
        @login_entries = LoginEntry.all
      end

      @login_entries = search_login_entries(params[:search]) if params[:search].present?
      @login_entries = @login_entries.order(id: :desc).paginate(page: params[:page], per_page: 10)
    end

    def new
      @login_entry = LoginEntry.new
    end

    def create
      @login_entry = LoginEntry.new(set_params)
      @login_entry.channel_partner = set_channel_partner
      @login_entry.user = current_user

      if @login_entry.save
        flash[:notice] = 'New disbursement created successfully.'
        redirect_to sales_manager_login_entries_path
      else
        flash[:error] = @login_entry.errors.full_messages.join(', ')
        render :new
      end
    end

    def update
      redirect_to sales_manager_login_entries_path if @login_entry.payment

      @login_entry.channel_partner = set_channel_partner
      @login_entry.user = current_user
      @login_entry.approved = params[:login_entry][:approved] ? true : false

      if @login_entry.update(set_params)
        flash[:notice] = 'Login Entry updated successfully.'
        redirect_to sales_manager_login_entries_path
      else
        flash[:error] = @login_entry.errors.full_messages.join(', ')
        render :edit
      end
    end

    def edit
      redirect_to sales_manager_login_entries_path if @login_entry.payment
    end

    def show; end

    def destroy
      @login_entry.destroy
      flash[:notice] = 'Login Entry deleted successfully.'
      redirect_to sales_manager_login_entries_path
    end

    private

    def set_params
      params.require(:login_entry).permit(
        :customer_full_name,
        :business_name,
        :mobile_number,
        :email,
        :state,
        :city,
        :channel_partner_product_id,
        :customer_id,
        :dob,
        :process_date,
        :executive_id,
        :bank_id
      )
    end

    def get_login_entry
      @login_entry = LoginEntry.find_by!(id: params[:id])
    end

    def set_channel_partner
      ChannelPartner.find_by(id: params[:login_entry][:channel_partner])
    end

    def search_login_entries(search)
      key = "%#{search}%"
      columns = LoginEntry.column_names
      return LoginEntry.where(
        columns.map { |c| "#{c} like :search" }.join(' OR '),
        search: key
      )
    end
  end
end
