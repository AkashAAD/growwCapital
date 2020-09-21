class HomeLoanController < ApplicationController
  before_action :create_home_loan, only: [:create]
  before_action :update_home_loan, only: [:update]
  before_action :update_home_loan_offer_assets, only: [:update_home_loan_assets]

  include Wicked::Wizard
  steps :step1, :step2, :step3

  def show
    # session[:home_loan_id] = nil
    id = session[:home_loan_id]
    case params[:id]
    when "step1"
      @home_loan = id.nil? ? HomeLoan.new : get_home_loan(id)
    when "step2"
      @home_loan = id.nil? ? HomeLoan.new : get_home_loan(id)
    end
    render_wizard
  end

  def create
  	create_update_home_loan(@home_loan.save, "Home Loan created successfully.", home_loan_path("step2"))
  end

  def update
  	create_update_home_loan(@update_status_hl, "Home Loan created successfully.", home_loan_path("step2"))
  end

  def update_home_loan_assets
		if @update_status_hl
			session[:home_loan_id] = nil
			@asset_updated = true
		end
		create_update_home_loan(@update_status_hl, "Home Loan updated successfully.", home_loan_path("step3"))
  end

  private

  def home_loan_params
    params.require(:home_loan).permit(:loan_amount, :property_city, :annual_income, :mobile_number, :property_type, :property_cost, :current_employment, :current_emi, :full_name, :email, :dob)
  end

  def home_loan_assets_params
  	params.require(:home_loan).permit(:persoanl_bank_statement, :id_proof, :salary_slip, :business_bank_statement, :itr_copy, :passport_photo)
  end

	def create_home_loan
		@home_loan = HomeLoan.new(home_loan_params)
	end

	def get_home_loan(id)
		@home_loan = HomeLoan.find(id)
	end

	def update_home_loan
		@update_status_hl = get_home_loan(session[:home_loan_id]).update_attributes(home_loan_params)
	end

	def update_home_loan_offer_assets
		get_home_loan(session[:home_loan_id])
		@update_status_hl = @home_loan.update_attributes(home_loan_assets_params)
	end

	def create_update_home_loan(status, message, path)
		if status
			session[:home_loan_id] = @home_loan.id unless @asset_updated
			flash[:notice] = message
			redirect_to path
		else
			render "home_loan/step1" #business_loan_path("step1")
		end
	end

end
