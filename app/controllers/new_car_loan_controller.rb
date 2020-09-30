class NewCarLoanController < ApplicationController
	before_action :create_new_car_loan, only: [:create]
	before_action :create_new_car_loan_offer, only: [:create_business_offer]
	before_action :update_new_car_loan, only: [:update, :update_address]
	before_action :update_new_car_loan_offer, only: [:update_business_offer]
	before_action :update_new_car_loan_assets, only: [:update_assets]

	include Wicked::Wizard
	steps :step1, :step2, :step3, :step4

	def new
    @new_car_loan = NewCarLoan.new		
	end

	def show
		# session[:new_car_loan_id] = nil
		id = session[:new_car_loan_id]
		case params[:id]
		when "step1"
			@new_car_loan = id.nil? ? NewCarLoan.new : get_new_car_loan(id)
		when "step2", "step3"
			@new_car_loan = id.nil? ? NewCarLoan.new : get_new_car_loan(id)
			# @new_car_loan_offer =  @new_car_loan.new_car_loan_offer.try(:id) ? @new_car_loan.new_car_loan_offer : NewCarLoanOffer.new
		end
		render_wizard
	end

	def create
    create_update_new_car_loan(@new_car_loan.save, "New Car Loan created successfully.", new_car_loan_path("step2"), "step1")
	end

	def update
    create_update_new_car_loan(@update_status_ncl, "New Car Loan updated successfully.", new_car_loan_path("step2"), params[:id])
	end

	def update_address
		create_update_new_car_loan(@update_status_ncl, "New Car Loan updated successfully.", new_car_loan_path("step3"), params[:id])
	end

	def update_assets
		if @update_status_ncl
			session[:new_car_loan_id] = nil
			@asset_updated = true
		end
		create_update_new_car_loan(@update_status_ncl, "New Car Loan updated successfully.", new_car_loan_path("step4"), params[:id])
	end

	private
	def new_car_loan_params
    params.require(:new_car_loan).permit(:registration_state, :registration_city, :car_manufacturer, :car_model, :current_residency_since_year, :residence_type, :dob, :gender, :profession_status, :current_working_company, :industry_type, :monthly_salary, :mobile_number, :first_name, :last_name, :email, :res_address_line1, :res_address_line2, :res_state, :res_city, :res_pincode, :office_address_line1, :office_address_line2, :office_state, :office_city, :office_pincode)
	end

	def new_car_loan_assets_params
    params.require(:new_car_loan).permit(:persoanl_bank_statement, :business_bank_statement, :id_proof, :salary_slip, :itr_copy, :passport_photo)		
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

	def update_new_car_loan_assets
		get_new_car_loan(session[:new_car_loan_id])
		@update_status_ncl = @new_car_loan.update_attributes(new_car_loan_assets_params)
	end


	def create_update_new_car_loan(status, message, path, step)
		if status
			session[:new_car_loan_id] = @new_car_loan.id unless @asset_updated
			flash[:notice] = message
			redirect_to path
		else
			render "new_car_loan/#{step}"
		end
	end
end
