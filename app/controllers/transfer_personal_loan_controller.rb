class TransferPersonalLoanController < ApplicationController
  before_action :create_transfer_personal_loan, only: [:create, :create_otp]
  before_action :create_transfer_personal_loan_employer, only: [:create_employer]
  before_action :update_transfer_personal_loan, only: [:update]
  before_action :update_transfer_personal_loan_employer, only: [:update_employer, :updated_address]
	before_action :transfer_personal_loan_assets, only: [:update_transfer_personal_loan_assets]
  before_action :apply_loan, only: [:select_bank]

  include Wicked::Wizard
  steps :step1, :step2, :step3, :step4, :step5, :step6

	def show
		# session[:transfer_personal_loan_id] = nil
		id = session[:transfer_personal_loan_id]
		case params[:id]
		when "step1"
			@transfer_personal_loan = id.nil? ? TransferPersonalLoan.new : get_transfer_personal_loan(id)
    when "step2"
      @transfer_personal_loan = id.nil? ? TransferPersonalLoan.new : get_transfer_personal_loan(id)
      return redirect_to transfer_personal_loan_path("step1") if id.nil?
    when "step3", "step4"
      @transfer_personal_loan = id.nil? ? TransferPersonalLoan.new : get_transfer_personal_loan(id)
      @banks = @transfer_personal_loan.banks
      return redirect_to transfer_personal_loan_path("step1") unless @transfer_personal_loan.otp_verified
    when "step5"
      @transfer_personal_loan = id.nil? ? TransferPersonalLoan.new : get_transfer_personal_loan(id)
      return redirect_to transfer_personal_loan_path("step1") unless @transfer_personal_loan.otp_verified
    when "step6"
      return redirect_to transfer_personal_loan_path("step1") if id.nil?      
      @transfer_personal_loan = get_transfer_personal_loan(id) #TransferPersonalLoan.last
      LoanMailer.transfer_personal_loan(@transfer_personal_loan).deliver_later
      session[:transfer_personal_loan_id] = nil
		end
		render_wizard
	end

  def create_otp
    @transfer_personal_loan.reference_number = "TPSNL#{(rand*100000000).to_i}"
    unless @transfer_personal_loan.otp_verified
      send_otp
    end
    if session[:transfer_personal_loan_id]
      @transfer_personal_loan.update_attributes(transfer_personal_loan_params)
    else
      @transfer_personal_loan.save
    end
    session[:transfer_personal_loan_id] = @transfer_personal_loan.id
    # create_update_transfer_personal_loan(@transfer_personal_loan.save, "Personal Loan created successfully.", transfer_personal_loan_path("step2"))
  end

  def update_otp_status
    @transfer_personal_loan = get_transfer_personal_loan(session[:transfer_personal_loan_id])
    if !@transfer_personal_loan.otp.eql?(params[:transfer_personal_loan][:otp].to_i)
      @transfer_personal_loan.otp_verified = true
      @transfer_personal_loan.save
      flash[:notice] = "The entered OTP verified successfully."
      # redirect_to transfer_personal_loan_path("step4")
    else
      flash[:error] = "The entered OTP is not valid."
      # redirect_to transfer_personal_loan_path("step3")
    end
  end

	def create
    create_update_transfer_personal_loan(@transfer_personal_loan.save, "Personal Loan created successfully.", transfer_personal_loan_path("step2"))
	end

  def update
    flash[:notice] = "Transfer personal Loan updated successfully."
    # create_update_transfer_personal_loan(@update_status_pl, "Personal Loan updated successfully.", transfer_personal_loan_path("step2"))
  end

  def update_employer
    create_update_transfer_personal_loan(@update_status_pe, "Personal Loan employer_detail updated successfully.", transfer_personal_loan_path("step3"))
  end

  def select_bank
    create_update_transfer_personal_loan(@update_status_pe, "Personal Loan bank selected successfully.", transfer_personal_loan_path("step4"))
  end

  def updated_address
    create_update_transfer_personal_loan(@update_status_pe, "Personal Loan updated successfully.", transfer_personal_loan_path("step5"))
  end

  def update_transfer_personal_loan_assets
		create_update_transfer_personal_loan(@update_status_pl, "Personal Loan updated successfully.", transfer_personal_loan_path("step6"))
  end

  def get_employer
  	employers = Employer.search_employer(params[:term])
  	render json: { employers: employers }, status:  :ok
  end

  def resend_otp
    @transfer_personal_loan = get_transfer_personal_loan(session[:transfer_personal_loan_id])
    send_otp
  end

	private
	def transfer_personal_loan_params
    params.require(:transfer_personal_loan).permit(:full_name,
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
      :foreclose_loan_amount,
      :desired_loan_amount,
      :mobile_number,
      :otp,
      :otp_verified,
      :reference_number,
      :terms_and_conditions,
      :personal_loan_bank_id,
      :bank_name,
      :current_emi,
      :existing_card,
      :status,
      :aadhar_front,
      :is_topup_amount,
      :existing_roi,
      :existing_bank_name,
      :aadhar_back)
	end

	def transfer_personal_loan_assets_params
    params.require(:transfer_personal_loan).permit(:id_proof_front, :id_proof_back)
	end

	def create_transfer_personal_loan
		@transfer_personal_loan = TransferPersonalLoan.new(transfer_personal_loan_params)
	end

	def update_transfer_personal_loan
    @update_status_pl = get_transfer_personal_loan(session[:transfer_personal_loan_id]).update_attributes(transfer_personal_loan_params)
	end

	def update_transfer_personal_loan_employer
		get_transfer_personal_loan(session[:transfer_personal_loan_id])
		@update_status_pe = @transfer_personal_loan.update_attributes(transfer_personal_loan_params)
	end

	def create_transfer_personal_loan_employer
    get_transfer_personal_loan(session[:transfer_personal_loan_id])
    @employer_detail = EmployerDetail.new(employer_detail_params)
    @employer_detail.transfer_personal_loan_id = @transfer_personal_loan.id
	end

	def transfer_personal_loan_assets
		get_transfer_personal_loan(session[:transfer_personal_loan_id])
		@update_status_pl = @transfer_personal_loan.update_attributes(transfer_personal_loan_params)
	end

  def apply_loan
    get_transfer_personal_loan(session[:transfer_personal_loan_id])
    @transfer_personal_loan.transfer_personal_loan_bank_id = params[:transfer_personal_loan_bank][:id]
    @update_status_pe = @transfer_personal_loan.save
  end

	def create_update_transfer_personal_loan(status, message, path)
		if status
      session[:transfer_personal_loan_id] = @transfer_personal_loan.id if session[:transfer_personal_loan_id].nil?
			flash[:notice] = message
			redirect_to path
		else
			render "transfer_personal_loan/step1"
		end
	end

	def create_update_transfer_personal_loan_employer(status, message, path)
		if status
			flash[:notice] = message
			redirect_to path
		else
			render "transfer_personal_loan/step2"
		end
	end

  def get_transfer_personal_loan(id)
    @transfer_personal_loan = TransferPersonalLoan.find(id)
  end

  def send_otp
    sms = SmsService.new
    @transfer_personal_loan.otp = (rand*1000000).to_i
    @transfer_personal_loan.save
    sms.send_otp(@transfer_personal_loan, "Personal Loan")    
  end
end
