class UsedCarLoanController < ApplicationController
	before_action :create_used_car_loan, only: [:create_otp]
	before_action :update_used_car_loan, only: [:update]
  before_action :create_used_car_loan_offer, only: [:create_used_car_offer]
  before_action :update_used_car_loan_offer, only: [:update_used_car_offer, :update_address]
  before_action :update_used_car_loan_assets, only: [:update_used_car_assets]
  before_action :apply_loan, only: [:select_bank]  

	include Wicked::Wizard
	steps :step1, :step2, :step3, :step4, :step5, :step6, :step7

	def show
		# session[:used_car_loan_id] = nil
    id = session[:used_car_loan_id]
    case params[:id]
    when "step1"
      @used_car_loan = id.nil? ? UsedCarLoan.new : get_used_car_loan(id)
    when "step2"
      @used_car_loan = id.nil? ? UsedCarLoan.new : get_used_car_loan(id)
      return redirect_to used_car_loan_path("step1") if id.nil?
    when "step3", "step4"
      @used_car_loan = id.nil? ? UsedCarLoan.new : get_used_car_loan(id)
      @banks = @used_car_loan.banks
      return redirect_to used_car_loan_path("step1") unless @used_car_loan.otp_verified
    when "step5"
      @used_car_loan = id.nil? ? UsedCarLoan.new : get_used_car_loan(id)
      return redirect_to used_car_loan_path("step1") unless @used_car_loan.otp_verified      
    when "step6"
      return redirect_to used_car_loan_path("step1") if id.nil?      
      @used_car_loan = get_used_car_loan(id) #UsedCarLoan.last
      LoanMailer.used_car_loan(@used_car_loan).deliver_later
      session[:used_car_loan_id] = nil
    end
    render_wizard
	end

  def create_otp
    @used_car_loan.reference_number = "UCL#{(rand*100000000).to_i}"
    @used_car_loan.reference_number = "TPSNL#{(rand*100000000).to_i}"
    unless @used_car_loan.otp_verified
      send_otp
    end
    if session[:used_car_loan_id]
      @used_car_loan.update_attributes(used_car_loan_params)
    else
      @used_car_loan.save
    end
    session[:used_car_loan_id] = @used_car_loan.id
    # create_update_used_car_loan(@used_car_loan.save, "Used Car Loan created successfully.", used_car_loan_path("step2"))
  end

  def update_otp_status
    @used_car_loan = get_used_car_loan(session[:used_car_loan_id])
    if !@used_car_loan.otp.eql?(params[:used_car_loan][:otp].to_i)
      @used_car_loan.otp_verified = true
      @used_car_loan.save
      flash[:notice] = "The entered OTP verified successfully."
      # redirect_to used_car_loan_path("step4")
    else
      flash[:error] = "The entered OTP is not valid."
      # redirect_to used_car_loan_path("step3")
    end
  end

	def update
    flash[:notice] = "Used Car Loan updated successfully."
    # create_update_used_car_loan(@update_status_ncl, "Used Car Loan updated successfully.", used_car_loan_path("step2"))
	end

  def select_bank
    create_update_used_car_loan(@update_status_ncl, "Used Car Loan bank selected successfully.", used_car_loan_path("step4"))
  end  

	def create_used_car_offer
		create_update_used_car_loan_offer(@used_car_loan_offer.save, "Used Car Loan offer applied successfully.", used_car_loan_path("step3"))
	end

	def update_used_car_offer
		create_update_used_car_loan_offer(@update_status_nclo, "Used Car Loan offer applied successfully.", used_car_loan_path("step3"))
	end

  def update_address
    create_update_used_car_loan_offer(@update_status_nclo, "Used Car Loan updated successfully.", used_car_loan_path("step5"))
  end

	def update_used_car_assets
		session[:used_car_loan_id] = nil if @update_status_ncl
		create_update_used_car_loan(@update_status_ncl, "Used Car Loan updated successfully.", used_car_loan_path("step6"))
	end

  def resend_otp
    @used_car_loan = get_used_car_loan(session[:used_car_loan_id])
    send_otp
  end

	private
	def used_car_loan_params
    params.require(:used_car_loan).permit(:loan_amount,
      :tenure,
      :email,
      :mobile_number,
      :full_name,
      :car_manufacturer,
      :car_model,
      :car_registration_number,
      :model_year,
      :employment_type,
      :current_emi,
      :address,
      :city,
      :pincode,
      :office_address,
      :office_city,
      :office_pincode,
      :dob,
      :otp,
      :otp_verified,
      :reference_number,
      :terms_and_conditions,
      :new_car_loan_bank_id,
      :status,
      :aadhar_back,
      :aadhar_front)
	end

  def used_car_loan_offer_params
  end

	def used_car_loan_assets_params
    params.require(:used_car_loan).permit(:persoanl_bank_statement,
    	:business_bank_statement,
    	:id_proof,
    	:salary_slip,
    	:itr_copy,
    	:passport_photo)		
	end

	def get_used_car_loan(id)
		@used_car_loan = UsedCarLoan.find(id)
	end

	def create_used_car_loan
		@used_car_loan = UsedCarLoan.new(used_car_loan_params)
	end

	def update_used_car_loan
		@update_status_ncl = get_used_car_loan(session[:used_car_loan_id]).update_attributes(used_car_loan_params)
	end

  def apply_loan
    get_used_car_loan(session[:used_car_loan_id])
    @used_car_loan.used_car_loan_bank_id = params[:used_car_loan_bank][:id]
    @update_status_ncl = @used_car_loan.save
  end

	def create_used_car_loan_offer
		get_used_car_loan(session[:used_car_loan_id])
		@used_car_loan_offer = UsedCarLoanOffer.new(used_car_loan_offer_params)
		@used_car_loan_offer.used_car_loan_id = @used_car_loan.id
	end

	def update_used_car_loan_offer
		get_used_car_loan(session[:used_car_loan_id])
		@update_status_nclo = @used_car_loan.update_attributes(used_car_loan_params)
	end


	def update_used_car_loan_assets
		get_used_car_loan(session[:used_car_loan_id])
		@update_status_ncl = @used_car_loan.update_attributes(used_car_loan_assets_params)
	end

	def create_update_used_car_loan(status, message, path)
		if status
			session[:used_car_loan_id] = @used_car_loan.id
			flash[:notice] = message
			redirect_to path
		else
			render "used_car_loan/step1"
		end
	end
	
  def create_update_used_car_loan_offer(status, message, path)
		if status
			flash[:notice] = message
			redirect_to path
		else
			render "used_car_loan/step2"
		end
  end

  def send_otp
    sms = SmsService.new
    @used_car_loan.otp = (rand*1000000).to_i
    @used_car_loan.save
    sms.send_otp(@used_car_loan, "Used Car Loan")
  end
end
