class HomeController < ApplicationController
  before_action :authenticate_user!, only: [:profile]

  def index
  end

  def about_us
  end

  def pre_approved
  end

  def blog    
  end

  def contact_us
  	@contact_us = ContactU.new
  end

  def save_contact_us
    @contact_us = ContactU.new(contact_us_params)
    @contact_us.save
    flash[:notice] = "Your message sent successfully!"
    redirect_to contact_us_path    
  end

  def profile

  end

  def change_state
  	cities = [['-Select City-','']] + CS.cities(params[:state].to_sym, :in).map{ |val| [val, val.downcase] }
  	render json: { cities: cities }, status: :ok
  end

  def change_profession
    degrees = Degree.where(profession_id: params[:id])
    render json: { degrees: degrees }, status: :ok
  end

  private
  def contact_us_params
    params.require(:contact_u).permit(:first_name, :last_name, :email, :subject, :message)    
  end
end
