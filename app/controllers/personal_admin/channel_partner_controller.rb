module PersonalAdmin
  class ChannelPartnerController < ApplicationController
    before_action :get_channel_partner, only: [:edit, :show, :destroy, :update]
    before_action :authenticate_user!
    before_action :check_accountant
    layout 'personal_admin'

    def index
      @channel_partners = ChannelPartner.all.where('created_at >= ?', 3.days.ago)
      @channel_partners = search_channel_partners(params[:search]) if params[:search].present?
      @channel_partners = @channel_partners.order(id: :desc).paginate(page: params[:page], per_page: 10)
    end

    def new
      @channel_partner = ChannelPartner.new
    end

    def create
      @channel_partner = ChannelPartner.new(set_params)
      @channel_partner.user = current_user
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
      @channel_partner.user = current_user

      set_products
      if @channel_partner.update(set_params)
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
        :payout_percent
      )
    end

    def get_channel_partner
      @channel_partner = ChannelPartner.find_by!(id: params[:id])
    end

    def set_products
      params[:channel_partner][:products]&.each do |product|
        @channel_partner.products << Product.find_by(slug: product)        
      end
    end

    def search_channel_partners(search)
      key = "%#{search}%"
      columns = ChannelPartner.column_names
      return ChannelPartner.where(
        columns.map { |c| "#{c} like :search" }.join(' OR '),
        search: key
      )
    end
  end
end
