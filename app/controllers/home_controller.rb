class HomeController < ApplicationController
  def index
  end

  def about_us
  	
  end

  def contact_us
  	
  end

  def change_state
  	cities = [['-Select City-','']] + CS.cities(params[:state].to_sym, :in).map{ |val| [val, val.downcase] }
  	render json: { cities: cities }, status: :ok
  end
end
