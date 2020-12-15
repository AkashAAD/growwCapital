class BusinessLoanController < ApplicationController
	before_action :create_business_loan, only: [:create, :create_otp]
	before_action :create_business_loan_offer, only: [:create_business_offer]
	before_action :update_business_loan, only: [:update]
	before_action :update_business_loan_offer, only: [:update_business_offer, :updated_address]
	before_action :update_business_loan_offer_assets, only: [:update_business_offer_assets]
  before_action :apply_loan, only: [:select_bank]

	include Wicked::Wizard
  steps :step1, :step2, :step3, :step4, :step5, :step6, :step7

	def new
    @business_loan = BusinessLoan.new
	end

	def show
		# session[:business_loan_id] = nil
		id = session[:business_loan_id]
		case params[:id]
		when "step1"
			@business_loan = id.nil? ? BusinessLoan.new : get_business_loan(id)
		when "step2"
      @business_loan = id.nil? ? BusinessLoan.new : get_business_loan(id)
      return redirect_to business_loan_path("step1") if id.nil?
		when "step3", "step4"
      @business_loan = id.nil? ? BusinessLoan.new : get_business_loan(id)
      @banks = @business_loan.banks
      return redirect_to business_loan_path("step1") unless @business_loan.otp_verified
    when "step5"
      @business_loan = id.nil? ? BusinessLoan.new : get_business_loan(id)
      return redirect_to business_loan_path("step1") unless @business_loan.otp_verified
		when "step6"
      return redirect_to business_loan_path("step1") if id.nil?			
      @business_loan = get_business_loan(id)
      LoanMailer.business_loan(@business_loan).deliver_later
      session[:business_loan_id] = nil
		end
		render_wizard
	end

	def create_otp
		@business_loan.reference_number = "BSNL#{(rand*100000000).to_i}"
    unless @business_loan.otp_verified
      send_otp
    end
    if session[:business_loan_id]
      @business_loan.update_attributes(business_loan_params)
    else
      @business_loan.save
    end
    session[:business_loan_id] = @business_loan.id
	end

  def update_otp_status
    @business_loan = get_business_loan(session[:business_loan_id])
    if !@business_loan.otp.eql?(params[:business_loan][:otp].to_i)
      @business_loan.otp_verified = true
      @business_loan.save
      flash[:notice] = "The entered OTP verified successfully."
    else
      flash[:error] = "The entered OTP is not valid."
    end
  end

	def create
    create_update_business_loan(@business_loan.save, "Business Loan created successfully.", business_loan_path("step2"))
	end

	def update
		flash[:notice] = "Business Loan updated successfully."
	end

	def create_business_offer
    create_update_business_loan_offer(@business_loan_offer.save, "Business Loan offer applied successfully.", business_loan_path("step5"))
	end

	def update_business_offer
		create_update_business_loan_offer(@update_status_blo, "Business Loan updated successfully.", business_loan_path("step3"))
	end

	def select_bank
    create_update_business_loan_offer(@update_status_bl, "Personal Loan bank selected successfully.", business_loan_path("step4"))
	end

	def update_business_offer_assets
		create_update_business_loan_offer(@update_status_blo, "Business Loan updated successfully.", business_loan_path("step6"))
	end

  def updated_address
    create_update_business_loan_offer(@update_status_blo, "Business Loan updated successfully.", business_loan_path("step5"))
  end

  def resend_otp
    @business_loan = get_business_loan(session[:business_loan_id])
    send_otp
  end	

	private
	def business_loan_params
    params.require(:business_loan).permit(
     :loan_amount,
     :tenure,
     :email,
     :mobile_number,
     :full_name,
     :annual_turnover,
     :gross_annual_profit,
     :company_type,
     :business_nature,
     :current_emi,
     :address,
     :city,
     :pincode,
     :business_address,
     :business_city,
     :business_pincode,
     :dob,
     :otp,
     :otp_verified,
     :reference_number,
     :terms_and_conditions,
     :business_loan_bank_id,
     :bank_name,
     :status,
     :aadhar_card_front,
     :aadhar_card_back,
     :shockup_licence)
	end

	def business_loan_offer_assets_params
    params.require(:business_loan_offer).permit(:aadhar_card_front,
      :aadhar_card_back,
      :shockup_licence)
	end

	def get_business_loan(id)
		@business_loan = BusinessLoan.find(id)
	end

	def create_business_loan
		@business_loan = BusinessLoan.new(business_loan_params)
	end

	def update_business_loan
		@update_status_bl = get_business_loan(session[:business_loan_id]).update_attributes(business_loan_params)
	end

	def create_business_loan_offer
		get_business_loan(session[:business_loan_id])
		@business_loan_offer = BusinessLoanOffer.new(business_loan_offer_params)
		@business_loan_offer.business_loan_id = @business_loan.id
	end

	def update_business_loan_offer
		get_business_loan(session[:business_loan_id])
		@update_status_blo = @business_loan.update_attributes(business_loan_params)
	end

	def update_business_loan_offer_assets
		get_business_loan(session[:business_loan_id])
		@update_status_blo = @business_loan.update_attributes(business_loan_params)
	end

	def apply_loan
    get_business_loan(session[:business_loan_id])
    @business_loan.business_loan_bank_id = params[:business_loan_bank][:id]
    @update_status_bl = @business_loan.save
	end

	def create_update_business_loan(status, message, path)
		if status
			session[:business_loan_id] = @business_loan.id
      unless @business_loan.otp_verified
      	send_otp
      end
			flash[:notice] = message
			redirect_to path
		else
			render "business_loan/step1" #business_loan_path("step1")
		end
	end

	def create_update_business_loan_offer(status, message, path)
		if status
			flash[:notice] = message
			redirect_to path
		else
			render "business_loan/step2" #business_loan_path("step1")
		end
	end

	def send_otp
    sms = SmsService.new
    @business_loan.otp = (rand*1000000).to_i
    @business_loan.save
    sms.send_otp(@business_loan, "Business Loan")
	end
end
