module PersonalAdmin
  class HomeController < ApplicationController
    include ApplicationHelper
    before_action :authenticate_user!
    before_action :check_admin_manager
  	layout 'personal_admin'

  	def index; end

    def get_channel_products
      channel_partner = ChannelPartner.find(params[:id])

      render json: {
        products: channel_partner.channel_partner_products.map { |product| [product.product.name, product.id] },
        channel_partner: channel_partner
      }
    end

    def channel_partners
      render json: {
        channel_partners: ChannelPartner.where(channel_partner_type_id: params[:id])
      }
    end

    def get_login_entry
      login_entry = LoginEntry.find_by(id: params[:id])

      render json: {
        login_entry: login_entry,
        dob: login_entry.dob.to_date,
        process_date: login_entry.process_date.to_date,
        state: state(login_entry.state),
        city: login_entry.city.titleize,
        channel_partner: login_entry.channel_partner,
        product_name: login_entry.channel_partner_product.product.name,
        executive: login_entry.executive
      }
    end
  end
end
