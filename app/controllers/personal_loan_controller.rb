class PersonalLoanController < ApplicationController
  before_action :create_personal_loan, only: [:create, :create_otp]
  before_action :create_personal_loan_employer, only: [:create_employer]
  before_action :update_personal_loan, only: [:update]
  before_action :update_personal_loan_employer, only: [:update_employer]
	before_action :personal_loan_assets, only: [:update_personal_loan_assets]

  include Wicked::Wizard
  steps :step1, :step2, :step3, :step4, :step5, :step6

	def show
			# session[:personal_loan_id] = nil
		id = session[:personal_loan_id]
		case params[:id]
		when "step1", "step2"
			@personal_loan = id.nil? ? PersonalLoan.new : get_personal_loan(id)
		when "step3", "step4"
			@personal_loan = id.nil? ? PersonalLoan.new : get_personal_loan(id)
			@employer_detail =  @personal_loan.employer_detail.try(:id) ? @personal_loan.employer_detail : EmployerDetail.new
		end
		render_wizard
	end

  def create_otp
    # @personal_loan.save
    # session[:personal_loan_id] = @personal_loan.id
    # sms = SmsService.new
    # sms.send_otp(@personal_loan.mobile_number)
    # flash[:notice] = "Personal Loan created successfully." 
    # redirect_to personal_loan_path("step2")
    create_update_personal_loan(@personal_loan.save, "Personal Loan created successfully.", personal_loan_path("step2"))
  end

  def update_otp_status
    
  end

	def create
    create_update_personal_loan(@personal_loan.save, "Personal Loan created successfully.", personal_loan_path("step2"))
	end

  def update
    create_update_personal_loan(@update_status_pl, "Personal Loan updated successfully.", personal_loan_path("step2"))
  end

  def create_employer
    create_update_personal_loan_employer(@employer_detail.save, "Personal Loan employer_detail saved successfully.", personal_loan_path("step3"))
  end

  def update_employer
    create_update_personal_loan_employer(@update_status_pe, "Personal Loan employer_detail updated successfully.", personal_loan_path("step3"))    
  end

  def update_personal_loan_assets
		session[:personal_loan_id] = nil if @update_status_pl
		create_update_personal_loan_employer(@update_status_pl, "Personal Loan updated successfully.", personal_loan_path("step4"))
  end

  def get_employer
  	employers = Employer.search_employer(params[:term])
  	render json: { employers: employers }, status:  :ok
  end

	private
	def personal_loan_params
    params.require(:personal_loan).permit(:first_name,
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

	def employer_detail_params
    params.require(:employer_detail).permit(:employer_name,
    	:monthly_net_salary,
    	:office_email,
    	:years_in_current_job,
    	:designation,
    	:office_address_line1,
    	:office_address_line2,
    	:landmark,
    	:office_state,
    	:office_city,
    	:office_pincode,
    	:mailing_address,
    	:mobile_number,
    	:salary_bank_account_name,
    	:branch_name,
    	:current_emi,
    	:first_name,
    	:last_name,
    	:ref_mobile_number)
	end

	def personal_loan_assets_params
    params.require(:personal_loan).permit(:id_proof, :address_proof, :salary_slip, :passport_photo, :bank_statement)
	end

	def create_personal_loan
		@personal_loan = PersonalLoan.new(personal_loan_params)
	end

	def update_personal_loan
    @update_status_pl = get_personal_loan(session[:personal_loan_id]).update_attributes(personal_loan_params)
	end

	def update_personal_loan_employer
		get_personal_loan(session[:personal_loan_id])
		@update_status_pe = @personal_loan.employer_detail.update_attributes(employer_detail_params)
	end

	def create_personal_loan_employer
    get_personal_loan(session[:personal_loan_id])
    @employer_detail = EmployerDetail.new(employer_detail_params)
    @employer_detail.personal_loan_id = @personal_loan.id
	end

	def personal_loan_assets
		get_personal_loan(session[:personal_loan_id])
		@update_status_pl = @personal_loan.update_attributes(personal_loan_assets_params)
	end

	def create_update_personal_loan(status, message, path)
		if status
			session[:personal_loan_id] = @personal_loan.id
      if @personal_loan.
      sms = SmsService.new
      sms.send_otp(@personal_loan.mobile_number)      
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
    @personal_loan = PersonalLoan.find(id)
  end

end
