class HomeController < ApplicationController
  before_action :authenticate_user!, only: [:profile]
  before_action :pre_approved_user, only: [:pre_approved_offer]
  require "indian_pincodes"

  def index
    @title = 'best banks home loan personal interest rates credit card eligibility'
    @description = 'We can help you with all kinds of loans and loan transfers.
     If you’re looking for credit card, we can offer some of the best credit card offers and more. 
     Visit our website to know all about all the products and personalized services we offer.'
  end

  def channel_partner
    @title = 'Channel Partners Groww Capital, Nagpur credit cards home of loans best banks'
    @description = 'If you are looking at expanding and becoming more structured in your business,
     become our channel partners. We’re licensed representatives of leading financial 
     institutions and banks and offer opportunity to those looking for a foothold to establish themselves'
  end

  def career
    @title = 'Career with Groww Capital, credit card, loans Nagpur'
    @description = 'If you’re seeking a career in financial and investment industry,
     we are the best people to grow with. We offer growth and an environment that 
     will bring out the best in you.'
  end

  def about_us
    @title = 'GrowwCapital Nagpur for Home Loans best banks, Credit Cards Nagpur Insurance'
    @description = 'If you’re looking to get home loan, insurance or credit card for the first
     time, you need someone whose advice you can trust. 
     Get in touch with us for honest advise, understand the correct documentation process and more. 
     We will advise on correct EMI, good credit card, best bank offers for home loan and more.'
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

      session[:cc_full_name] = @credit_card.full_name
      session[:cc_email] = @credit_card.email
      session[:cc_mobile_number] = @credit_card.mobile_number

      session[:thank_you_path] = credit_card_path('step1')
      LoanMailer.instant_application(@credit_card, 'Credit Card').deliver_now
      redirect_to thank_you_path
    end
  end

  def personal_loan
    @personal_loan = CustomPersonalLoan.new

    @title = 'Eligibility Personal Loan lowest interest personal loan nagpur'
    @description = 'If you\'re looking to get personal loan for any emergency or generally 
      we can help you identify the best bank offering lowest 
      interest rates and minimum documentation and paperwork. 
      We have helped people get loans sanctioned and disbursed in hours!'

    if request.post?
      @personal_loan = CustomPersonalLoan.new(application_request_params(:custom_personal_loan))
      @personal_loan.save

      session[:pl_full_name] = @personal_loan.full_name
      session[:pl_email] = @personal_loan.email
      session[:pl_mobile_number] = @personal_loan.mobile_number

      session[:thank_you_path] = personal_loan_path('step1')
      LoanMailer.instant_application(@personal_loan, 'Personal Loan').deliver_later
      redirect_to thank_you_path
    end
  end

  def transfer_personal_loan
    @transfer_personal_loan = CustomTransferPersonalLoan.new

    @title = 'Process for personal loan transfer to other bank, balance loan transfer.'
    @description = 'If you wish to transfer your personal loan that you have taken from 
      one bank to another owing to lower interest rate or other personal reasons, 
      we are at your service to complete all the formalities quickly and swiftly. 
      Get in touch with us and transfer your personal loan transferred before you know it!'

    if request.post?
      @transfer_personal_loan = CustomTransferPersonalLoan.new(application_request_params(:custom_transfer_personal_loan))
      @transfer_personal_loan.save

      session[:tpl_full_name] = @transfer_personal_loan.full_name
      session[:tpl_email] = @transfer_personal_loan.email
      session[:tpl_mobile_number] = @transfer_personal_loan.mobile_number

      session[:thank_you_path] = transfer_personal_loan_path('step1')
      LoanMailer.instant_application(@transfer_personal_loan, 'Transfer Personal Loan').deliver_later
      redirect_to thank_you_path
    end
  end

  def business_loan
    @business_loan = CustomBusinessLoan.new

    @title = 'Interest rate business loans best banks start-up business loans for women.'
    @description = 'If you are looking for best banks to get business loans, we are here at your service. 
      Just give us a call and we will share all possible information to 
      help you take an informed decision and offer all the advice ahead of applying for loans'

    if request.post?
      @business_loan = CustomBusinessLoan.new(application_request_params(:custom_business_loan))
      @business_loan.save

      session[:bl_full_name] = @business_loan.full_name
      session[:bl_email] = @business_loan.email
      session[:bl_mobile_number] = @business_loan.mobile_number
      
      session[:thank_you_path] = business_loan_path('step1')
      LoanMailer.instant_application(@business_loan, 'Business Loan').deliver_later
      redirect_to thank_you_path
    end
  end

  def professional_loan
    @professional_loan = CustomProfessionalLoan.new

    @title = 'Interest rates Professional Loans for CA, CS. Professional loans for lawyers'
    @description = 'If you are a CA, CS, Doctor, Architect, or want professional loan
     to start your own physiotherapy center, Groww Capital can help you 
     procure best loan that fulfills all your requirements with ease. Click on this link 
     and speak to one of us so that we can help you over the phone or visit you personally to explain everything.'

    if request.post?
      @professional_loan = CustomProfessionalLoan.new(application_request_params(:custom_professional_loan))
      @professional_loan.save

      session[:prl_full_name] = @professional_loan.full_name
      session[:prl_email] = @professional_loan.email
      session[:prl_mobile_number] = @professional_loan.mobile_number

      session[:thank_you_path] = professional_loan_path('step1')
      LoanMailer.instant_application(@professional_loan, 'Professional Loan').deliver_later
      redirect_to thank_you_path
    end
  end

  def home_loan
    @home_loan = CustomHomeLoan.new

    @title = 'Eligibility Home loan best bank interest rates, home loan transfer sbi'
    @description = 'Whether you want to know about best bank to apply for home loan
     or want to get your home loan transferred from one bank to another, or 
     want to know about documentation or eligibility to apply for it, we are always at 
     your service, presenting the best options and best advice you’ll find anywhere! Call us today.'

    if request.post?
      @home_loan = CustomHomeLoan.new(application_request_params(:custom_home_loan))
      @home_loan.save

      session[:hl_full_name] = @home_loan.full_name
      session[:hl_email] = @home_loan.email
      session[:hl_mobile_number] = @home_loan.mobile_number

      session[:thank_you_path] = home_loan_path('step1')
      LoanMailer.instant_application(@home_loan, 'Home Loan').deliver_later
      redirect_to thank_you_path
    end
  end

  def transfer_home_loan
    @transfer_home_loan = CustomTransferHomeLoan.new

    @title = 'Documents required to transfer home procedure to transfer housing loan'
    @description = 'If you’re looking to transfer home loan from one bank to another,
      do visit out site to know the procedure, documents required for home 
      loan transfer and everything else that you want to. 
      We will suggest the best bank to transfer your home loan based on your requirements. Click on the link and get in touch with us.'

    if request.post?
      @transfer_home_loan = CustomTransferHomeLoan.new(application_request_params(:custom_transfer_home_loan))
      @transfer_home_loan.save

      session[:thl_full_name] = @transfer_home_loan.full_name
      session[:thl_email] = @transfer_home_loan.email
      session[:thl_mobile_number] = @transfer_home_loan.mobile_number

      session[:thank_you_path] = transfer_home_loan_path('step1')
      LoanMailer.instant_application(@transfer_home_loan, 'Transfer Home Loan').deliver_later
      redirect_to thank_you_path
    end
  end
  
  def loan_against_property
    @loan_against_property = CustomLoanAgainstProperty.new

    @title = 'Interest rates Loan against Property documents without income proof'
    @description = 'If you\'re looking for loan against property and want information like
     interest rates, documents required or if you can get it from banks 
     without submitting your income proof, our relationship manager can answer 
     all these questions for you and offer you service at your door step. Click on the link and get in touch with us.'

    if request.post?
      @loan_against_property = CustomLoanAgainstProperty.new(application_request_params(:custom_loan_against_property))
      @loan_against_property.save

      session[:lap_full_name] = @loan_against_property.full_name
      session[:lap_email] = @loan_against_property.email
      session[:lap_mobile_number] = @loan_against_property.mobile_number

      session[:thank_you_path] = loan_against_property_path('step1')
      LoanMailer.instant_application(@loan_against_property, 'Loan Against Property').deliver_later
      redirect_to thank_you_path
    end
  end

  def new_car_loan
    @new_car_loan = CustomNewCarLoan.new

    @title = 'New car loan interest rate, car loan EMI calculator, car loan bank'
    @description = 'If you want car loan and looking for a bank offering lowest interest rate,
     we can guide you. Before looking for banks offering car loans and interest rates 
     charged by various banks, let us calculate EMI of car that we will be paying. 
     Once that is finalized, we can select best bank. Click here for more info....'

    if request.post?
      @new_car_loan = CustomNewCarLoan.new(application_request_params(:custom_new_car_loan))
      @new_car_loan.save

      session[:ncl_full_name] = @new_car_loan.full_name
      session[:ncl_email] = @new_car_loan.email
      session[:ncl_mobile_number] = @new_car_loan.mobile_number

      session[:thank_you_path] = new_car_loan_path('step1')
      LoanMailer.instant_application(@new_car_loan, 'New Car Loan').deliver_later
      redirect_to thank_you_path
    end
  end

  def used_car_loan
    @used_car_loan = CustomUsedCarLoan.new

    @title = 'Eligibility used car loan financing, interest rates used car loan bank in Nagpur'
    @description = 'If you are looking for used car loan and want to know about bank options
     and other attractive offers, do let us know. Our Relationship Manager will be 
     at your service presenting the best banks, best offers. Click on this link to know more...'

    if request.post?
      @used_car_loan = CustomUsedCarLoan.new(application_request_params(:custom_used_car_loan))
      @used_car_loan.save

      session[:ucl_full_name] = @used_car_loan.full_name
      session[:ucl_email] = @used_car_loan.email
      session[:ucl_mobile_number] = @used_car_loan.mobile_number

      session[:thank_you_path] = used_car_loan_path('step1')
      LoanMailer.instant_application(@used_car_loan, 'Used Car Loan').deliver_later
      redirect_to thank_you_path
    end
  end

  def gold_loan
    @gold_loan = CustomGoldLoan.new

    @title = 'How to apply for gold loan documents, interest rate how to get gold loan'
    @description = 'If you’re in need of urgent money, and have gold sitting idle in bank,
     you can pledge this gold and get loan against it. 
     This is governed by RBI and you can.'

    if request.post?
      @gold_loan = CustomGoldLoan.new(application_request_params(:custom_gold_loan))
      @gold_loan.save
      session[:thank_you_path] = root_path
      LoanMailer.instant_application(@gold_loan, 'Gold Loan').deliver_later
      redirect_to thank_you_path
    end
  end

  def inssurance
    @inssurance = CustomInsurance.new

    @title = 'Buy insurance for car, bike term insurance how to choose life insurance'
    @description = 'We deal in all types of insurances to secure your life and
     of your loved ones, buy car insurance, building insurance, term insurance. 
     Complete & right guidance at your door step'

    if request.post?
      @inssurance = CustomInsurance.new(application_request_params(:custom_insurance))
      @inssurance.save
      session[:thank_you_path] = root_path
      LoanMailer.instant_application(@inssurance, "Insurance").deliver_later
      redirect_to thank_you_path
    end
  end

  def thank_you
    redirect_to root_path unless session[:thank_you_path]
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
    params.require(:instant_call).permit(:full_name, :mobile_number, :product_name)
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
