class BusinessLoanController < ApplicationController
	before_action :create_business_loan, only: [:create]
	before_action :create_business_loan_offer, only: [:create_business_offer]
	before_action :update_business_loan, only: [:update]
	before_action :update_business_loan_offer, only: [:update_business_offer]
	before_action :update_business_loan_offer_assets, only: [:update_business_offer_assets]

	include Wicked::Wizard
	steps :step1, :step2, :step3, :step4

	def new
    @business_loan = BusinessLoan.new		
	end

	def show
			# session[:business_loan_id] = nil
		id = session[:business_loan_id]
		case params[:id]
		when "step1"
			@business_loan = id.nil? ? BusinessLoan.new : get_business_loan(id)
		when "step2", "step3"
			@business_loan = id.nil? ? BusinessLoan.new : get_business_loan(id)
			@business_loan_offer =  @business_loan.business_loan_offer.try(:id) ? @business_loan.business_loan_offer : BusinessLoanOffer.new
		end
		render_wizard
	end

	def create
    create_update_business_loan(@business_loan.save, "Business Loan created successfully.", business_loan_path("step2"))
	end

	def update
    create_update_business_loan(@update_status_bl, "Business Loan updated successfully.", business_loan_path("step2"))
	end

	def create_business_offer
    create_update_business_loan_offer(@business_loan_offer.save, "Business Loan offer applied successfully.", business_loan_path("step3"))
	end

	def update_business_offer
		create_update_business_loan_offer(@update_status_blo, "Business Loan updated successfully.", business_loan_path("step3"))
	end

	def update_business_offer_assets
		session[:business_loan_id] = nil if @update_status_blo
		create_update_business_loan_offer(@update_status_blo, "Business Loan updated successfully.", business_loan_path("step4"))
	end

	private
	def business_loan_params
		 params.require(:business_loan).permit(:loan_amount, :current_employment, :annual_turnover, :gross_annual_profit, :residence_city, :email, :mobile_number)
	end

	def business_loan_offer_params
    params.require(:business_loan_offer).permit(:company_type, :business_nature, :industry_type, :business_years, :current_emi, :full_name, :gender, :pincode, :pancard, :dob, :is_rbi_offer, :residence_type, :city)
	end

	def business_loan_offer_assets_params
    params.require(:business_loan_offer).permit(:bank_statement, :id_proof, :residential_address_proof, :office_address_proof, :itr_copy, :passport_photo)		
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
