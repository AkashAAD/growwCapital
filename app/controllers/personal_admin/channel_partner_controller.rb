module PersonalAdmin
  class ChannelPartnerController < ApplicationController
    before_action :get_channel_partner, only: [:edit, :show, :destroy, :update]
    before_action :authenticate_user!
    before_action :check_accountant
    layout 'personal_admin'

    def index
      @channel_partners = []
      @types = ChannelPartnerType.pluck(:name, :id)
      
      search_channel_partners

      respond_to do |format|
        format.html
        format.xlsx
      end
    end

    def new
      @channel_partner = ChannelPartner.new
    end

    def create
      @channel_partner = ChannelPartner.new(set_params)
      @channel_partner.user = current_user

      set_channel_partner_type
      set_products

      if @channel_partner.save
        ApplicationMailer.welcome_channel_partner(@channel_partner).deliver_later
        flash[:notice] = 'New channel partner created successfully.'
        redirect_to sales_manager_channel_partners_path
      else
        flash[:error] = @channel_partner.errors.full_messages.join(', ')
        render :new
      end
    end

    def update
      @channel_partner.products.destroy_all

      set_channel_partner_type
      set_products

      if @channel_partner.update_attributes(set_params.merge!(channel_partner_type_id: @channel_partner.channel_partner_type&.id))
        flash[:notice] = 'Channel Partner updated successfully.'
        redirect_to sales_manager_channel_partners_path
      else
        flash[:error] = @channel_partner.errors.full_messages.join(', ')
        render :edit
      end
    end

    def edit; end

    def show; end

    def destroy
      @channel_partner.destroy
      flash[:notice] = 'Channel Partner deleted successfully.'
      redirect_to sales_manager_channel_partners_path
    end

    def channel_partner_name
      render json: { name: channel_partner(params[:code])&.full_name }
    end

    private

    def set_params
      params.require(:channel_partner).permit(
        :full_name,
        :email,
        :mobile_number,
        :firm_name,
        :state,
        :city,
        :onbording_date,
        :code,
        :bank_id,
        :account_number,
        :ifsc_code,
        :micr_code,
        :name_as_per_bank,
        :full_address,
        :bank_account_type,
        :channel_partner_type_id,
        :aadhar_number,
        :pan_number
      )
    end

    def get_channel_partner
      @channel_partner = ChannelPartner.find_by!(id: params[:id])
    end

    def set_channel_partner_type
      channel_partner_type = ChannelPartnerType.find_by(slug: params[:channel_partner][:channel_partner_type_id])
      @channel_partner.channel_partner_type = channel_partner_type
    end

    def set_products
      params[:channel_partner][:products]&.each do |channel_partner_product|
        product = Product.find_by(slug: channel_partner_product[1]['product_slug'])

        @channel_partner.channel_partner_products.new(
          payout_percent: channel_partner_product[1]['product_payout_percent'],
          product_id: product&.id
        )
      end
    end

    def search_channel_partners
      if params[:type].present? || session[:channel_partner].present?
        session[:channel_partner] = params[:type] unless params[:type].nil?
        @channel_partners = ChannelPartner.where(channel_partner_type_id: params[:type] || session[:channel_partner])
      end

      if params[:search].present?
        key = "%#{params[:search]}%"
        columns = ChannelPartner.column_names
        @channel_partners = ChannelPartner.where(
          columns.map { |c| "#{c} like :search" }.join(' OR '),
          search: key
        )
      end

      return @channel_partners if params[:format] == 'xlsx'
      @channel_partners = @channel_partners.order(id: :desc).paginate(page: params[:page], per_page: 10) unless @channel_partners.blank?
    end
  end
end
