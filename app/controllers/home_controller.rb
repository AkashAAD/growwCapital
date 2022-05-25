class HomeController < ApplicationController
  before_action :authenticate_user!, only: [:profile]
  before_action :pre_approved_user, only: [:pre_approved_offer]
  require "indian_pincodes"

  def index
    @title = 'Home loan in Nagpur | Deal with best finance company in nagpur'
    @description = 'Growwcapital can help you with all kinds of credit card or car, personal & home loan in Nagpur. Enjoy personalized service with finance company in Nagpur. Call +91-9112345687'
  end

  def channel_partner
    @title = 'Channel Partners GrowwCapital, Nagpur credit cards home of loans best banks'
    @description = 'If you are looking at expanding and becoming more structured in your business,
     become our channel partners. We’re licensed representatives of leading financial 
     institutions and banks and offer opportunity to those looking for a foothold to establish themselves'
     @channel_partner_payment = ChannelPartnerPayment.new
     @friancise_application = ChannelPartnerPayment.find(params[:applicant_id]) if params[:applicant_id]
  end

  def career
    @title = 'Career with GrowwCapital, credit card, loans Nagpur'
    @description = 'If you’re seeking a career in financial and investment industry,
     we are the best people to grow with. We offer growth and an environment that 
     will bring out the best in you.'
  end

  def about_us
    @title = 'Best Finance Service Company in Nagpur | About Us'
    @description = 'We are leading finance service company in nagpur for home loan, insurance or credit cards. Understand the correct documentation process and visit office at Civil Lines, Nagpur. No charge on service.'
  end

  def terms_and_conditions
    @title = 'GrowwCapital best offers home loans, insurance, credit cards Nagpur'
    @description = 'GrowwCapital is a platform that takes you closer to loan providing banks, best offers and
      companies selling credit cards and insurance policies of different kinds. We are based in Nagpur, Ms'
  end

  def privacy_policy
    @title = 'GrowwCapital home loans, insurance, credit cards offers Nagpur'
    @description = 'GrowwCapital is a platform that takes you closer to loan providing banks, best offers and
      companies selling credit cards and insurance policies of different kinds. We are based in Nagpur, Ms'
  end

  def pre_approved
    @pre_approved_offer = PreApprovedOffer.new
    @title = 'Check Offers for HDFC Credit card | Personal Insurance Policy'
    @description = 'Understand the importance of insurance, credit cards in detail. Visit our Nagpur branch and know about life insurance, health insurance, general insurance. Check new offers on credit cards'
  end

  def instant_call
    @instant_call = InstantCall.new(instant_call_params)
    @instant_call.save
    LoanMailer.instant_call(@instant_call).deliver_later
    flash[:notice] = "Thank you for the details. Our associate will reach to you soon."
  end

  def job_apply
    ApplicationMailer.job_application(params.require(:job_application).permit!).deliver_later
    flash[:notice] = "Thank you for the details. We will reach to you soon."
    redirect_to career_path
  end

  def refer_earn
    @refer_earn = ReferEarn.new(refer_earn_params)
    @refer_earn.reference_number = "REF-#{(rand * 1000000000).to_i}"
    @refer_earn.save
    LoanMailer.refer_earn_admin(@refer_earn).deliver_later
    LoanMailer.refer_earn_customer(@refer_earn).deliver_later
    flash[:notice] = "Thank you for the reference. Our associate will reach to you soon. your reference number is #{@refer_earn.reference_number}"
  end

  def emi_calculator
    @title = 'Gold Loan EMI Calulator | Check Rate of Interest, Amount, Tenure'
    @description = 'Gold loan calculator hepls you to check emi for all banks such as SBI, HDFC, Axis, ICICI, Muthoot, etc. Check EMI, total amount , total interest. Check Now'
  end

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
    @title = 'Contact Us | Book an Appointment | GrowwCapital.com'
    @description = 'Feel free to connect with us regarding your questions and concerns by contacting us. Submit your query about loan enquiry, insurance question. We reply you within two business days.'
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
    @title = 'Apply online for new Credit Card | Credit Card eligibilty checker'
    @description = 'Applying for a new credit card but feeling trouble, check credit card eligibilty. Apply online for HDFC, SBI, IDBI, Axis, American Express credit card. No charges apply.'

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
    @title = 'Check eligibility for personal in Nagpur | Lowest Rate of Interest'
    @description = 'GrowwCapital is offering urgent personal loan in Nagpur from the best bank. Personal loan with lowest interest rates and minimum documentation. Get loans sanctioned and disbursed in hours.'

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
    @title = 'Personal loan transfer process in Nagpur | Balance loan transfer | GrowwCapital'
    @description = 'Easily transfer your personal loan from one bank to another. Searching for lower interest rate? At your service as personal loan service provider in Nagpur Call on +91-9112345687.'

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
    @title = 'Start-up Business Loans for Women | Best Banks for Business Loan | Low Rate of Interest'
    @description = 'Compare rate of interest for business loan in Nagpur. Get information on top banks for finance in Nagpur. Feel free to take advice.'

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
    @title = 'Interest rates for Professional Loan | CA, CS Professional loans for lawyers'
    @description = 'Enquire for CA, CS, Doctor, Architect professional loan to start your own business. Comapre rate of interest and grab a best deal with loan provider companies. Visit you personally.'

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
    @title = 'Check Eligibility for Home Loan | Loan Consultant | Check Interest Rates'
    @description = 'In Nagpur, searching for home loan consultant, agent or finance company? Know about documentation and eligibility to apply for it. We are presenting the most suitable options. Call us today.'

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
    @title = 'Loan Consultant Services in Nagpur | Transfer Home Loan Procedure'
    @description = 'GrowwCapital is the leading loan consultancy service firm in Nagpur. Know the process and check different banks interest rates. Get best advice on home loan transfer.'

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
    @title = 'Apply for Loan against Property in Nagpur | Compare Rate of Interest'
    @description = 'Want information for loan against property in Nagpur with comparision of banks interest rates? We prvide you quality service and answer all questions to you. Enjoy door step service.'

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
    @title = 'New Car Loan in Nagpur | Check Interest Rate, EMI Calculator, Best Bank'
    @description = 'Get a new car loan in Nagpur at the lowest interest rate. Check car loan EMI and interest rates charged by various banks. Call +91-9112345687'

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
    @title = 'Second Hand Car Finance in Nagpur | Check Used Car Loan Rate of Interest'
    @description = 'Compare rate of interest for used car loan for diifferent banks in Nagpur. Know about bank attractive offers on second hand car loan. GrowwCapital will be at your service always. Apply Now'

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
    @title = 'Apply for Gold Loan in Nagpur | Check Current Price and Rate of Interest'
    @description = 'If you’re in need of urgent money, check the process for gold loan. Compare today\'s price and rate of interest using calculator. We are govern as per RBI guideline.'

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

  def refer_earn_params
    params.require(:refer_earn).permit(:full_name, :mobile_number, :product_name, :referer_full_name, :referer_mobile_number)
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
