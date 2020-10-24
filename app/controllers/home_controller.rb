class HomeController < ApplicationController
  def index
  end

  def about_us
  	
  end

  def contact_us
  	@contact_us = ContactU.new
    if request.method.eql?("POST")
      @contact_us = ContactU.new(contact_us_params)
      @contact_us.save
      flash[:notice] = "Your message sent successfully!"
      redirect_to contact_us_path
    end
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
