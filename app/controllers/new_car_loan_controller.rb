class NewCarLoanController < ApplicationController
	before_action :create_new_car_loan, only: [:create_otp]
	before_action :update_new_car_loan, only: [:update]
  before_action :create_new_car_loan_offer, only: [:create_new_car_offer]
  before_action :update_new_car_loan_offer, only: [:update_new_car_offer, :update_address]
  before_action :update_new_car_loan_assets, only: [:update_new_car_assets]
  before_action :apply_loan, only: [:select_bank]

	include Wicked::Wizard
	steps :step1, :step2, :step3, :step4, :step5, :step6, :step7

	def show
		# session[:new_car_loan_id] = nil
    id = session[:new_car_loan_id]
    case params[:id]
    when "step1"
      @new_car_loan = id.nil? ? NewCarLoan.new : get_new_car_loan(id)
    when "step2"
      @new_car_loan = id.nil? ? NewCarLoan.new : get_new_car_loan(id)
      return redirect_to new_car_loan_path("step1") if id.nil?
    when "step3", "step4"
      @new_car_loan = id.nil? ? NewCarLoan.new : get_new_car_loan(id)
      @banks = @new_car_loan.banks
      return redirect_to new_car_loan_path("step1") unless @new_car_loan.otp_verified
    when "step5"
      @new_car_loan = id.nil? ? NewCarLoan.new : get_new_car_loan(id)
      return redirect_to new_car_loan_path("step1") unless @new_car_loan.otp_verified
    when "step6"
      return redirect_to new_car_loan_path("step1") if id.nil?      
      @new_car_loan = get_new_car_loan(id) #NewCarLoan.last
      LoanMailer.new_car_loan(@new_car_loan).deliver_later
      is_preapproved
      session[:new_car_loan_id] = nil
    end
    render_wizard
	end

  def create_otp
    @new_car_loan.reference_number = "NCL#{(rand*100000000).to_i}"
    unless @new_car_loan.otp_verified
      send_otp
    end
    if session[:new_car_loan_id]
      @new_car_loan.update_attributes(new_car_loan_params)
    else
      @new_car_loan.save
      session[:ncl_mobile_number] = nil
    end
    session[:new_car_loan_id] = @new_car_loan.id
    # create_update_new_car_loan(@new_car_loan.save, "New Car Loan created successfully.", new_car_loan_path("step2"))
  end

  def update_otp_status
    @new_car_loan = get_new_car_loan(session[:new_car_loan_id])
    if !@new_car_loan.otp.eql?(params[:new_car_loan][:otp].to_i)
      @new_car_loan.otp_verified = true
      @new_car_loan.save
      flash[:notice] = "The entered OTP verified successfully."
      # redirect_to new_car_loan_path("step4")
    else
      flash[:error] = "The entered OTP is not valid."
      # redirect_to new_car_loan_path("step3")
    end
  end

	def update
    flash[:notice] = "New Car Loan updated successfully."
    # create_update_new_car_loan(@update_status_ncl, "New Car Loan updated successfully.", new_car_loan_path("step2"))
	end

  def select_bank
    create_update_new_car_loan(@update_status_ncl, "New Car Loan bank selected successfully.", new_car_loan_path("step4"))
  end

	def create_new_car_offer
		create_update_new_car_loan_offer(@new_car_loan_offer.save, "New Car Loan offer applied successfully.", new_car_loan_path("step3"))
	end

	def update_new_car_offer
		create_update_new_car_loan_offer(@update_status_nclo, "New Car Loan offer applied successfully.", new_car_loan_path("step3"))
	end

  def update_address
    create_update_new_car_loan_offer(@update_status_nclo, "New Car Loan updated successfully.", new_car_loan_path("step5"))
  end

	def update_new_car_assets
		session[:new_car_loan_id] = nil if @update_status_ncl
		create_update_new_car_loan(@update_status_ncl, "New Car Loan updated successfully.", new_car_loan_path("step6"))
	end

  def resend_otp
    @new_car_loan = get_new_car_loan(session[:new_car_loan_id])
    send_otp
  end

	private
	def new_car_loan_params
    params.require(:new_car_loan).permit(:loan_amount,
      :tenure,
      :email,
      :mobile_number,
      :full_name,
      :car_manufacturer,
      :car_model,
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

  def new_car_loan_offer_params
  end

	def new_car_loan_assets_params
    params.require(:new_car_loan).permit(:persoanl_bank_statement,
    	:business_bank_statement,
    	:id_proof,
    	:salary_slip,
    	:itr_copy,
    	:passport_photo)		
	end

	def get_new_car_loan(id)
		@new_car_loan = NewCarLoan.find(id)
	end

	def create_new_car_loan
		@new_car_loan = NewCarLoan.new(new_car_loan_params)
	end

	def update_new_car_loan
		@update_status_ncl = get_new_car_loan(session[:new_car_loan_id]).update_attributes(new_car_loan_params)
	end

  def apply_loan
    get_new_car_loan(session[:new_car_loan_id])
    @new_car_loan.new_car_loan_bank_id = params[:new_car_loan_bank][:id]
    @update_status_ncl = @new_car_loan.save
  end  

	def create_new_car_loan_offer
		get_new_car_loan(session[:new_car_loan_id])
		@new_car_loan_offer = NewCarLoanOffer.new(new_car_loan_offer_params)
		@new_car_loan_offer.new_car_loan_id = @new_car_loan.id
	end

	def update_new_car_loan_offer
		get_new_car_loan(session[:new_car_loan_id])
		@update_status_nclo = @new_car_loan.update_attributes(new_car_loan_params)
    session[:ncl_full_name] = nil
    session[:ncl_email] = nil
	end


	def update_new_car_loan_assets
		get_new_car_loan(session[:new_car_loan_id])
		@update_status_ncl = @new_car_loan.update_attributes(new_car_loan_assets_params)
	end

	def create_update_new_car_loan(status, message, path)
		if status
			session[:new_car_loan_id] = @new_car_loan.id
			flash[:notice] = message
			redirect_to path
		else
			render "new_car_loan/step1"
		end
	end
	
  def create_update_new_car_loan_offer(status, message, path)
		if status
			flash[:notice] = message
			redirect_to path
		else
			render "new_car_loan/step2"
		end
  end

  def send_otp
    sms = SmsService.new
    @new_car_loan.otp = (rand*1000000).to_i
    @new_car_loan.save
    sms.send_otp(@new_car_loan, "New Car Loan")
  end

  def is_preapproved
    pre_approved_offer = PreApprovedOffer.find_by(mobile_no: @new_car_loan.mobile_number)
    if @new_car_loan.mobile_number != pre_approved_offer&.mobile_no
      pre_approved_offer = PreApprovedOffer.new(mobile_no: @new_car_loan.mobile_number,
        reference_number: "PREAPRO#{(rand*100000000).to_i}",
        first_name: @new_car_loan.full_name,
        last_name: @new_car_loan.full_name)
      pre_approved_offer.save
    end
  end
end
