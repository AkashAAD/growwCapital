module PersonalAdmin
  class HomeController < ApplicationController
    before_action :authenticate_user!
  	layout 'personal_admin'

  	def index
  		
  	end
  end
end
