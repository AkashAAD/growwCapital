class HomeController < ApplicationController
  before_action :authenticate_user!, only: [:profile]
  before_action :pre_approved_user, only: [:pre_approved_offer]
  require "indian_pincodes"

  def index
    @instant_call = InstantCall.new
  end

  def about_us
  end

  def pre_approved
    @pre_approved_offer = PreApprovedOffer.new
  end

  def instant_call
    @instant_call = InstantCall.new(instant_call_params)
    @instant_call.save
    LoanMailer.instant_call(@instant_call).deliver_later
    flash[:notice] = "Thank you for the details. Our associate will reach to you soon."
  end

  def emi_calculator; end

  def check_pincode
    pincode_status = IndianPincodes.search(params[:pincode])
    if pincode_status && pincode_status[:city].downcase == params[:city]
      pincode_status = true
    else
      pincode_status = false
    end
    render json: { pincode_status: pincode_status }
  end

  def car_models
    car_models = CarManufacturer.find(params[:id]).car_models
    render json: { car_models: car_models }
  end

  def pre_approved_offer
    if @pre_approved_offer
      @pre_approved_offer.first_name = pre_approved_offer_params[:first_name]
      @pre_approved_offer.last_name = pre_approved_offer_params[:last_name]
      @pre_approved_offer.opt_status = false
      @pre_approved_offer.save
      unless @pre_approved_offer.errors.blank?
        flash[:error] = @pre_approved_offer.errors.full_messages.join(', ')
      else
        send_sms
      end
    else
      send_sms
    end
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
      flash[:notice] = "Your entered OTP is verified successfully."
      @url = "/pre_approved_status?pre_approved_offer_id=#{@pre_approved_offer&.id}"
      # redirect_to pre_approved_status_path + "?pre_approved_offer_id=#{@pre_approved_offer&.id}"
    else
      flash[:error] = "Please enter correct OTP. Entered OTP is wrong!"
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
    ApplicationMailer.contact_us(@contact_us).deliver_later
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

  def credit_card
    @credit_card = CustomCreditCard.new

    @title = 'HDFC credit card offers IDFC bank Salary SBI Credit Card American express'
    @description = 'If you’re looking to apply for a credit card but feel overwhelmed with 
      all the choices, we are at your service. We provide all the assistance for 
      all matters related to credit card and help you choose one that works 
      best for you without you having to step out of your home!'

    if request.post?
      @credit_card = CustomCreditCard.new(application_request_params(:custom_credit_card))
      @credit_card.save
      redirect_to thank_you_path
    end
  end

  def personal_loan
    @personal_loan = CustomPersonalLoan.new
    if request.post?
      @personal_loan = CustomPersonalLoan.new(application_request_params(:custom_personal_loan))
      @personal_loan.save
      redirect_to thank_you_path
    end
  end

  def transfer_personal_loan
    @transfer_personal_loan = CustomTransferPersonalLoan.new
    if request.post?
      @transfer_personal_loan = CustomTransferPersonalLoan.new(application_request_params(:custom_transfer_personal_loan))
      @transfer_personal_loan.save
      redirect_to thank_you_path
    end
  end

  def business_loan
    @business_loan = CustomBusinessLoan.new
    if request.post?
      @business_loan = CustomBusinessLoan.new(application_request_params(:custom_business_loan))
      @business_loan.save
      redirect_to thank_you_path
    end
  end

  def professional_loan
    
  end

  def home_loan
    
  end

  def transfer_home_loan
    
  end
  
  def loan_against_property
    
  end

  def new_car_loan
    
  end

  def used_car_loan
    
  end

  def thank_you
    
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

  def instant_call_params
    params.require(:instant_call).permit(:full_name, :mobile_number, :email, :city)    
  end

  def send_sms
    session[:pre_mobile_no] = pre_approved_offer_params[:mobile_no]
    session[:pre_otp] = "#{(rand * 1000000).to_i}"
    sms = SmsService.new
    sms.send_preapproved_otp(pre_approved_offer_params, session[:pre_otp])
  end

  def application_request_params(params_obj)
    params.require(params_obj).permit(:full_name, :email, :mobile_number, :loan_purpose)
  end

end
