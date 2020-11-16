class HomeController < ApplicationController
  before_action :authenticate_user!, only: [:profile]
  before_action :pre_approved_user, only: [:pre_approved_offer]

  def index
  end

  def about_us
  end

  def pre_approved
    @pre_approved_offer = PreApprovedOffer.new
  end

  def pre_approved_offer
    if @pre_approved_offer
      @pre_approved_offer.first_name = pre_approved_offer_params[:first_name]
      @pre_approved_offer.last_name = pre_approved_offer_params[:last_name]
      @pre_approved_offer.opt_status = false
      @pre_approved_offer.save
      unless @pre_approved_offer.errors.blank?
        flash[:error] = @pre_approved_offer.errors.full_messages.join(', ')
        return redirect_to pre_approved_path
      end
    end

    session[:pre_mobile_no] = pre_approved_offer_params[:mobile_no]
    session[:pre_otp] = "#{(rand * 1000000).to_i}"
    sms = SmsService.new
    sms.send_preapproved_otp(pre_approved_offer_params, session[:pre_otp])
    redirect_to confirm_otp_path
  end

  def pre_approved_status
    return redirect_to root_path if session[:pre_otp].nil?
    session[:pre_mobile_no] = nil
    session[:pre_otp] = nil
    @pre_approved_offer = PreApprovedOffer.find_by(id: params[:pre_approved_offer_id])
  end

  def confirm_otp; end

  def verfiy_pre_approved
    if session[:pre_otp] == params[:otp]
      @pre_approved_offer = PreApprovedOffer.find_by(mobile_no: session[:pre_mobile_no])
      if @pre_approved_offer
        @pre_approved_offer.opt_status = true
        @pre_approved_offer.save
      end
      flash[:notice] = "Your entered OTP is vefified successfully."
      redirect_to pre_approved_status_path + "?pre_approved_offer_id=#{@pre_approved_offer&.id}"
    else
      flash[:error] = "Please enter correct OTP. Entered OTP is wrong!"
      redirect_to confirm_otp_path
    end
  end

  def blog    
  end

  def newsletter
    newsletter = NewsletterSubscription.new(email: params[:newsletter][:email])
    newsletter.save
    flash[:notice] = "You have successfully subscribed to Growwcapital!"
    redirect_to root_path
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

  def pre_approved_offer_params
    params.require(:pre_approved_offer).permit(:first_name, :last_name, :mobile_no)    
  end

  def pre_approved_user
    @pre_approved_offer = PreApprovedOffer.find_by(mobile_no: pre_approved_offer_params[:mobile_no])
  end
end
