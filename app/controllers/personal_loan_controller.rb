class PersonalLoanController < ApplicationController
  before_action :create_personal_loan, only: [:create, :create_otp]
  before_action :create_personal_loan_employer, only: [:create_employer]
  before_action :update_personal_loan, only: [:update]
  before_action :update_personal_loan_employer, only: [:update_employer, :updated_address]
	before_action :personal_loan_assets, only: [:update_personal_loan_assets]
  before_action :apply_loan, only: [:select_bank]

  include Wicked::Wizard
  steps :step1, :step2, :step3, :step4, :step5, :step6

	def show
		# session[:personal_loan_id] = nil
		id = session[:personal_loan_id]
		case params[:id]
		when "step1"
			@personal_loan = id.nil? ? PersonalLoan.new : get_personal_loan(id)
    when "step2"
      @personal_loan = id.nil? ? PersonalLoan.new : get_personal_loan(id)
      return redirect_to personal_loan_path("step1") if id.nil?
    when "step3", "step4"
      @personal_loan = id.nil? ? PersonalLoan.new : get_personal_loan(id)
      @banks = @personal_loan.banks
      return redirect_to personal_loan_path("step1") unless @personal_loan.otp_verified
    when "step5"
      @personal_loan = id.nil? ? PersonalLoan.new : get_personal_loan(id)
      return redirect_to personal_loan_path("step1") unless @personal_loan.otp_verified
    when "step6"
      # return redirect_to personal_loan_path("step1") if id.nil?
      @personal_loan = PersonalLoan.last
      # LoanMailer.personal_loan(@personal_loan).deliver_later
      is_preapproved
      session[:personal_loan_id] = nil
		end
		render_wizard
	end

  def create_otp
    @personal_loan.reference_number = "PSNL#{(rand*100000000).to_i}"
    unless @personal_loan.otp_verified
      send_otp
    end
    if session[:personal_loan_id]
      @personal_loan.update_attributes(personal_loan_params)
    else
      @personal_loan.save
      session[:pl_mobile_number] = nil
    end
    session[:personal_loan_id] = @personal_loan.id
  end

  def update_otp_status
    @personal_loan = get_personal_loan(session[:personal_loan_id])
    if !@personal_loan.otp.eql?(params[:personal_loan][:otp].to_i)
      @personal_loan.otp_verified = true
      @personal_loan.save
      flash[:notice] = "The entered OTP verified successfully."
    else
      flash[:error] = "The entered OTP is not valid."
    end
  end

	def create
    create_update_personal_loan(@personal_loan.save, "Personal Loan created successfully.", personal_loan_path("step2"))
	end

  def update
    flash[:notice] = "Personal Loan updated successfully."
  end

  def update_employer
    create_update_personal_loan(@update_status_pe, "Personal Loan employer_detail updated successfully.", personal_loan_path("step3"))
  end

  def select_bank
    create_update_personal_loan(@update_status_pe, "Personal Loan bank selected successfully.", personal_loan_path("step4"))
  end

  def updated_address
    create_update_personal_loan(@update_status_pe, "Personal Loan updated successfully.", personal_loan_path("step5"))
  end

  def update_personal_loan_assets
		create_update_personal_loan(@update_status_pl, "Personal Loan updated successfully.", personal_loan_path("step6"))
  end

  def get_employer
  	employers = Employer.search_employer(params[:term])
  	render json: { employers: employers }, status:  :ok
  end

  def resend_otp
    @personal_loan = get_personal_loan(session[:personal_loan_id])
    send_otp
  end

	private
	def personal_loan_params
    params.require(:personal_loan).permit(:full_name,
     :employer_name,
     :tenure,
     :monthly_net_salary,
     :email,
     :dob,
     :address,
     :city,
     :pincode,
     :office_address,
     :office_city,
     :office_pincode,
     :loan_amount,
     :mobile_number,
     :otp,
     :otp_verified,
     :reference_number,
     :terms_and_conditions,
     :personal_loan_bank_id,
     :current_emi,
     :existing_card,
     :bank_name,
     :status,
     :id_proof_front,
     :id_proof_back)
	end

	def personal_loan_assets_params
    params.require(:personal_loan).permit(:id_proof_front, :id_proof_back)
	end

	def create_personal_loan
    if get_personal_loan(session[:personal_loan_id]).nil?
		  @personal_loan = PersonalLoan.new(personal_loan_params)
    end
	end

	def update_personal_loan
    @update_status_pl = get_personal_loan(session[:personal_loan_id]).update_attributes(personal_loan_params)
	end

	def update_personal_loan_employer
		get_personal_loan(session[:personal_loan_id])
		@update_status_pe = @personal_loan.update_attributes(personal_loan_params)
    session[:pl_full_name] = nil
    session[:pl_email] = nil
	end

	def create_personal_loan_employer
    get_personal_loan(session[:personal_loan_id])
    @employer_detail = EmployerDetail.new(employer_detail_params)
    @employer_detail.personal_loan_id = @personal_loan.id
	end

	def personal_loan_assets
		get_personal_loan(session[:personal_loan_id])
		@update_status_pl = @personal_loan.update_attributes(personal_loan_params)
	end

  def apply_loan
    get_personal_loan(session[:personal_loan_id])
    @personal_loan.personal_loan_bank_id = params[:personal_loan_bank][:id]
    @update_status_pe = @personal_loan.save
  end

	def create_update_personal_loan(status, message, path)
		if status
      session[:personal_loan_id] = @personal_loan.id if session[:personal_loan_id].nil?
			flash[:notice] = message
			redirect_to path
		else
			render "personal_loan/step1"
		end
	end

	def create_update_personal_loan_employer(status, message, path)
		if status
			flash[:notice] = message
			redirect_to path
		else
			render "personal_loan/step2"
		end
	end

  def get_personal_loan(id)
    @personal_loan = PersonalLoan.find_by(id: id)
  end

  def send_otp
    sms = SmsService.new
    @personal_loan.otp = (rand*1000000).to_i
    @personal_loan.save
    sms.send_otp(@personal_loan, "Personal Loan")
  end

  def is_preapproved
    pre_approved_offer = PreApprovedOffer.find_by(mobile_no: @personal_loan.mobile_number)
    if @personal_loan.mobile_number != pre_approved_offer&.mobile_no
      pre_approved_offer = PreApprovedOffer.new(mobile_no: @personal_loan.mobile_number,
        reference_number: "PREAPRO#{(rand*100000000).to_i}",
        first_name: @personal_loan.full_name,
        last_name: @personal_loan.full_name)
      pre_approved_offer.save
    end
  end

end
