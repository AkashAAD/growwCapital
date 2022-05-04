module PersonalAdmin
  class HomeController < ApplicationController
    before_action :authenticate_user!
    before_action :check_sales_manager
  	layout 'personal_admin'

  	def index; end
  end
end
