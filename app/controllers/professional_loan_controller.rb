class ProfessionalLoanController < ApplicationController
  before_action :create_professsional_loan, only: [:create]
  before_action :create_professional_loan_offer, only: [:create_professional_offer]
  before_action :update_professsional_loan, only: [:update]
  before_action :update_professional_loan_offer, only: [:update_professional_offer]
  before_action :update_professsional_loan_assets, only: [:update_professsional_assets]

  include Wicked::Wizard
  steps :step1, :step2, :step3, :step4

  def show
			# session[:professional_loan_id] = nil
		id = session[:professional_loan_id]
		case params[:id]
		when "step1"
			@professional_loan = id.nil? ? ProfessionalLoan.new : get_professional_loan(id)
		when "step2", "step3"
			@professional_loan = id.nil? ? ProfessionalLoan.new : get_professional_loan(id)
			@professional_loan_offer =  @professional_loan.professional_loan_offer.try(:id) ? @professional_loan.professional_loan_offer : ProfessionalLoanOffer.new
		end
		render_wizard
  end

  def create
  	create_update_professional_loan(@professional_loan.save, "Professional Loan created successfully.", professional_loan_path("step2"))
  end

  def update
    create_update_professional_loan(@update_status_pl, "Professional Loan updated successfully.", professional_loan_path("step2"))  	
  end

  def create_professional_offer
  	create_update_professional_loan_offer(@professional_loan_offer.save, "Professional Loan offer applied successfully.", professional_loan_path("step3"))
  end

  def update_professional_offer
  	create_update_professional_loan_offer(@update_status_plo, "Professional Loan offer applied successfully.", professional_loan_path("step3"))
  end

  def update_professsional_assets
		session[:professional_loan_id] = nil if @update_status_plo
		create_update_professional_loan_offer(@update_status_plo, "Professional Loan updated successfully.", professional_loan_path("step4"))  	
  end

  private
  def professsional_loan_params
  	params.require(:professional_loan).permit(:loan_amount, :current_employment, :profession_type, :current_profession_since_year, :annual_income, :residence_city, :email, :mobile_number)
  end

  def professsional_loan_offer_params
  	params.require(:professional_loan_offer).permit(:bank_account_name, :current_emi, :full_name, :gender, :pincode, :pancard, :dob, :is_rbi_offer, :residence_type)
  end

  def professsional_loan_offer_assets_params
  	params.require(:professional_loan).permit(:bank_statement, :id_proof, :residential_address_proof, :degree, :registration_certificate, :office_address_proof, :itr_copy, :passport_photo)
  end

  def create_professsional_loan
    @professional_loan = ProfessionalLoan.new(professsional_loan_params)  	
  end

	def update_professsional_loan
		@update_status_pl = get_professional_loan(session[:professional_loan_id]).update_attributes(professsional_loan_params)
	end

	def create_professional_loan_offer
		get_professional_loan(session[:professional_loan_id])
		@professional_loan_offer = ProfessionalLoanOffer.new(professsional_loan_offer_params)
		@professional_loan_offer.professional_loan_id = @professional_loan.id
	end

	def update_professional_loan_offer
		get_professional_loan(session[:professional_loan_id])
		@update_status_plo = @professional_loan.professional_loan_offer.update_attributes(professsional_loan_offer_params)
	end

	def update_professsional_loan_assets
		get_professional_loan(session[:professional_loan_id])
		@update_status_plo = @professional_loan.update_attributes(professsional_loan_offer_assets_params)
	end

  def get_professional_loan(id)
  	@professional_loan = ProfessionalLoan.find(id)
  end

  def create_update_professional_loan(status, message, path)
		if status
			session[:professional_loan_id] = @professional_loan.id
			flash[:notice] = message
			redirect_to path
		else
			render "professional_loan/step1" #business_loan_path("step1")
		end
  end

  def create_update_professional_loan_offer(status, message, path)
		if status
			flash[:notice] = message
			redirect_to path
		else
			render "professional_loan/step2"
		end
  end

end
