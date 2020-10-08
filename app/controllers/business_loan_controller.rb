class BusinessLoanController < ApplicationController
	before_action :create_business_loan, only: [:create, :create_otp]
	before_action :create_business_loan_offer, only: [:create_business_offer]
	before_action :update_business_loan, only: [:update]
	before_action :update_business_loan_offer, only: [:update_business_offer]
	before_action :update_business_loan_offer_assets, only: [:update_business_offer_assets]

	include Wicked::Wizard
  steps :step1, :step2, :step3, :step4, :step5, :step6

	def new
    @business_loan = BusinessLoan.new		
	end

	def show
			# session[:business_loan_id] = nil
		id = session[:business_loan_id]
		case params[:id]
		when "step1"
			@business_loan = id.nil? ? BusinessLoan.new : get_business_loan(id)
      return redirect_to business_loan_path("step2") if !@business_loan.otp_verified && !@business_loan.otp.blank?
      return redirect_to business_loan_path("step3") if @business_loan.otp_verified
		when "step2"
      @business_loan = id.nil? ? BusinessLoan.new : get_business_loan(id)
      return redirect_to business_loan_path("step3") if @business_loan.otp_verified
		when "step3", "step4", "step5"
			@business_loan = id.nil? ? BusinessLoan.new : get_business_loan(id)
      return redirect_to business_loan_path("step2") unless @business_loan.otp_verified
			@business_loan_offer =  @business_loan.business_loan_offer.try(:id) ? @business_loan.business_loan_offer : BusinessLoanOffer.new
		when "step6"
      @business_loan = get_business_loan(id)
      session[:business_loan_id] = nil			
		end
		render_wizard
	end

	def create_otp
		@business_loan.reference_number = "BSNL#{(rand*100000000).to_i}"
    create_update_business_loan(@business_loan.save, "Business Loan created successfully.", business_loan_path("step2"))
	end

  def update_otp_status
    @business_loan = get_business_loan(session[:business_loan_id])
    if @business_loan.otp.eql?(params[:business_loan][:otp])
      @business_loan.otp_verified = true
      @business_loan.save
      flash[:error] = "The entered OTP verified successfully."
      redirect_to business_loan_path("step3")
    else
      flash[:error] = "The entered OTP is not valid."
      redirect_to business_loan_path("step2")
    end
  end

	def create
    create_update_business_loan(@business_loan.save, "Business Loan created successfully.", business_loan_path("step2"))
	end

	def update
    create_update_business_loan(@update_status_bl, "Business Loan updated successfully.", business_loan_path("step4"))
	end

	def create_business_offer
    create_update_business_loan_offer(@business_loan_offer.save, "Business Loan offer applied successfully.", business_loan_path("step5"))
	end

	def update_business_offer
		create_update_business_loan_offer(@update_status_blo, "Business Loan updated successfully.", business_loan_path("step5"))
	end

	def update_business_offer_assets
		# session[:business_loan_id] = nil if @update_status_blo
		create_update_business_loan_offer(@update_status_blo, "Business Loan updated successfully.", business_loan_path("step6"))
	end

	private
	def business_loan_params
    params.require(:business_loan).permit(:first_name,
    	:middle_name,
    	:last_name,
    	:dob,
    	:gender,
    	:marital_status,
    	:highest_qualification,
    	:no_of_dependent,
    	:current_residency_since_year,
    	:current_city_since_year,
    	:pan_number,
    	:purpose_of_loan,
    	:address_line1,
    	:address_line2,
    	:landmark,
    	:city,
    	:state,
    	:pincode,
    	:residential_type,
      :mobile_number,
      :email,
      :loan_amount,
      :tenure)
	end

	def business_loan_offer_params
    params.require(:business_loan_offer).permit(:business_name,
    	:business_nature,
    	:industry_type,
    	:business_years,
    	:current_emi,
    	:annual_turnover,
    	:gross_annual_profit,
    	:business_pan_number,
    	:gst_number,
    	:residence_type,
    	:address_line1,
    	:address_line2,
    	:landmark,
    	:state,
    	:city,
    	:pincode)
	end

	def business_loan_offer_assets_params
    params.require(:business_loan_offer).permit(:bank_statement,
    	:id_proof,
    	:residential_address_proof,
    	:office_address_proof,
    	:itr_copy,
    	:passport_photo)		
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
		@update_status_blo = @business_loan.business_loan_offer.update_attributes(business_loan_offer_params)
	end

	def update_business_loan_offer_assets
		get_business_loan(session[:business_loan_id])
		@update_status_blo = @business_loan.business_loan_offer.update_attributes(business_loan_offer_assets_params)
	end


	def create_update_business_loan(status, message, path)
		if status
			session[:business_loan_id] = @business_loan.id
      unless @business_loan.otp_verified
        sms = SmsService.new
        @business_loan.otp = 1234
        @business_loan.save
        sms.send_otp(@business_loan)
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
end
