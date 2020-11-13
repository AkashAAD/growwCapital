class ProfessionalLoanController < ApplicationController
  before_action :create_professsional_loan, only: [:create, :create_otp]
  before_action :create_professional_loan_offer, only: [:create_professional_offer]
  before_action :update_professsional_loan, only: [:update]
  before_action :update_professional_loan_offer, only: [:update_professional_offer]
  before_action :update_professsional_loan_assets, only: [:update_professional_assets]
  before_action :apply_loan, only: [:select_bank]

  include Wicked::Wizard
  steps :step1, :step2, :step3, :step4, :step5, :step6, :step7

  def show
		# session[:professional_loan_id] = nil
    id = session[:professional_loan_id]
    case params[:id]
    when "step1"
      @professional_loan = id.nil? ? ProfessionalLoan.new : get_professional_loan(id)
      return redirect_to professional_loan_path("step2") if !@professional_loan.otp_verified && !@professional_loan.otp.blank?
      return redirect_to professional_loan_path("step3") if @professional_loan.otp_verified
    when "step2"
      @professional_loan = id.nil? ? ProfessionalLoan.new : get_professional_loan(id)
      return redirect_to professional_loan_path("step3") if @professional_loan.otp_verified
    when "step3", "step4", "step6"
      @professional_loan = id.nil? ? ProfessionalLoan.new : get_professional_loan(id)
      return redirect_to professional_loan_path("step2") unless @professional_loan.otp_verified
      @professional_loan_offer =  @professional_loan.professional_loan_offer.try(:id) ? @professional_loan.professional_loan_offer : ProfessionalLoanOffer.new
    when "step5"
      @professional_loan = id.nil? ? ProfessionalLoan.new : get_professional_loan(id)
      @banks = @professional_loan.banks
      return redirect_to professional_loan_path("step2") unless @professional_loan.otp_verified      
    when "step7"
      @professional_loan = get_professional_loan(id) #ProfessionalLoan.last
      session[:professional_loan_id] = nil
    end
    render_wizard
  end

  def create_otp
    @professional_loan.reference_number = "PROL#{(rand*100000000).to_i}"
    create_update_professional_loan(@professional_loan.save, "Professional Loan created successfully", professional_loan_path("step2"))
  end

  def update_otp_status
    @professional_loan = get_professional_loan(session[:professional_loan_id])
    if !@professional_loan.otp.eql?(params[:professional_loan][:otp])
      @professional_loan.otp_verified = true
      @professional_loan.save
      flash[:notice] = "The entered OTP verified successfully."
      redirect_to professional_loan_path("step3")
    else
      flash[:error] = "The entered OTP is not valid."
      redirect_to professional_loan_path("step2")
    end
  end

  def create
  	create_update_professional_loan(@professional_loan.save, "Professional Loan created successfully.", professional_loan_path("step2"))
  end

  def update
    create_update_professional_loan(@update_status_pl, "Professional Loan updated successfully.", professional_loan_path("step4"))
  end

  def select_bank
    create_update_professional_loan(@update_status_pl, "Professional Loan bank selected successfully.", professional_loan_path("step6"))
  end

  def create_professional_offer
  	create_update_professional_loan_offer(@professional_loan_offer.save, "Professional Loan offer applied successfully.", professional_loan_path("step5"))
  end

  def update_professional_offer
  	create_update_professional_loan_offer(@update_status_plo, "Professional Loan offer applied successfully.", professional_loan_path("step5"))
  end

  def update_professional_assets
		create_update_professional_loan_offer(@update_status_plo, "Professional Loan updated successfully.", professional_loan_path("step7"))
  end

  private
  def professsional_loan_params
  	params.require(:professional_loan).permit(:first_name,
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
      :tenure,
      :terms_and_conditions)
  end

  def professsional_loan_offer_params
  	params.require(:professional_loan_offer).permit(:profession_type,
      :degree,
      :current_profession_since_year,
      :annual_income,
      :current_emi)
  end

  def professsional_loan_offer_assets_params
  	params.require(:professional_loan).permit(:bank_statement,
      :id_proof,
      :residential_address_proof,
      :degree,
      :registration_certificate,
      :office_address_proof,
      :itr_copy,
      :passport_photo)
  end

  def create_professsional_loan
    @professional_loan = ProfessionalLoan.new(professsional_loan_params)  	
  end

	def update_professsional_loan
		@update_status_pl = get_professional_loan(session[:professional_loan_id]).update_attributes(professsional_loan_params)
	end

  def apply_loan
    get_professional_loan(session[:professional_loan_id])
    @professional_loan.professional_loan_bank_id = params[:professional_loan_bank][:id]
    @update_status_pl = @professional_loan.save
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
      unless @professional_loan.otp_verified
        sms = SmsService.new
        @professional_loan.otp = 1234
        @professional_loan.save
        sms.send_otp(@professional_loan)
      end
      flash[:notice] = message
      redirect_to path
    else
      render "professional_loan/step1"
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
