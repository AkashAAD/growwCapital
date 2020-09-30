class LoanAgainstPropertyController < ApplicationController
  before_action :create_loan_against_property, only: [:create]
	before_action :create_loan_against_property_offer, only: [:create_against_property_offer]
  before_action :update_loan_against_property, only: [:update]
	before_action :update_loan_against_property_offer, only: [:update_against_property_offer]
  before_action :update_loan_against_property_offer_assets, only: [:update_against_property_assets]

  include Wicked::Wizard
  steps :step1, :step2, :step3, :step4

  def show
    # session[:loan_against_property_id] = nil
    id = session[:loan_against_property_id]
    case params[:id]
    when "step1"
      @loan_against_property = id.nil? ? LoanAgainstProperty.new : get_loan_against_property(id)
		when "step2", "step3"
			@loan_against_property = id.nil? ? LoanAgainstProperty.new : get_loan_against_property(id)
			@loan_against_property_offer =  @loan_against_property.loan_against_property_offer.try(:id) ? @loan_against_property.loan_against_property_offer : LoanAgainstPropertyOffer.new
		end
    render_wizard
  end

  def create
  	create_update_loan_against_property(@loan_against_property.save, "Loan Against Property created successfully.", loan_against_property_path("step2"))
  end

  def update
  	create_update_loan_against_property(@update_status_lap, "Loan Against Property created successfully.", loan_against_property_path("step2"))
  end

	def create_against_property_offer
    create_update_against_property_offer(@loan_against_property_offer.save, "Loan Against Property offer applied successfully.", loan_against_property_path("step3"))
	end

	def update_against_property_offer
		create_update_against_property_offer(@update_status_lapo, "Loan Against Property updated successfully.", loan_against_property_path("step3"))
	end

  def update_against_property_assets
		session[:loan_against_property_id] = nil if @update_status_lapo
		create_update_against_property_offer(@update_status_lapo, "Loan Against Property updated successfully.", loan_against_property_path("step4"))
  end

  private

  def loan_against_property_params
    params.require(:loan_against_property).permit(:current_emi, :full_name, :dob, :property_cost, :email, :property_type, :open_land, :constructed_property)
  end

  def loan_against_property_offer_params
  	params.require(:loan_against_property_offer).permit(:loan_amount, :employment_type, :city, :annual_income, :mobile_number)
  end

  def loan_against_property_assets_params
    params.require(:loan_against_property).permit(:persoanl_bank_statement, :id_proof, :salary_slip, :itr_copy, :property_photo, :passport_photo)
  end

	def create_loan_against_property
		@loan_against_property = LoanAgainstProperty.new(loan_against_property_params)
	end

	def get_loan_against_property(id)
		@loan_against_property = LoanAgainstProperty.find(id)
	end

	def update_loan_against_property
		@update_status_lap = get_loan_against_property(session[:loan_against_property_id]).update_attributes(loan_against_property_params)
	end

	def create_loan_against_property_offer
		get_loan_against_property(session[:loan_against_property_id])
		@loan_against_property_offer = LoanAgainstPropertyOffer.new(loan_against_property_offer_params)
		@loan_against_property_offer.loan_against_property_id = @loan_against_property.id
	end

	def update_loan_against_property_offer
		get_loan_against_property(session[:loan_against_property_id])
		@update_status_lapo = @loan_against_property.loan_against_property_offer.update_attributes(loan_against_property_offer_params)
	end

	def update_loan_against_property_offer_assets
		get_loan_against_property(session[:loan_against_property_id])
		@update_status_lapo = @loan_against_property.update_attributes(loan_against_property_assets_params)
	end

	def create_update_loan_against_property(status, message, path)
		if status
			session[:loan_against_property_id] = @loan_against_property.id
			flash[:notice] = message
			redirect_to path
		else
			render "loan_against_property/step1" #business_loan_path("step1")
		end
	end

	def create_update_against_property_offer(status, message, path)
		if status
			flash[:notice] = message
			redirect_to path
		else
			render "loan_against_property/step2"
		end
	end

end
