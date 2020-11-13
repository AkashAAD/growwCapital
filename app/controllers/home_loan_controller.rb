class HomeLoanController < ApplicationController
  before_action :create_home_loan, only: [:create_otp]
  before_action :update_home_loan, only: [:update]
  before_action :create_home_loan_offer, only: [:create_home_offer]
  before_action :update_home_loan_offer, only: [:update_home_offer]
  before_action :update_home_loan_assets, only: [:update_home_assets]
  before_action :apply_loan, only: [:select_bank]  

  include Wicked::Wizard
  steps :step1, :step2, :step3, :step4, :step5, :step6, :step7

  def show
    # session[:home_loan_id] = nil
    id = session[:home_loan_id]
    case params[:id]
    when "step1"
      @home_loan = id.nil? ? HomeLoan.new : get_home_loan(id)
      return redirect_to home_loan_path("step2") if !@home_loan.otp_verified && !@home_loan.otp.blank?
      return redirect_to home_loan_path("step3") if @home_loan.otp_verified
    when "step2"
      @home_loan = id.nil? ? HomeLoan.new : get_home_loan(id)
      return redirect_to home_loan_path("step3") if @home_loan.otp_verified
    when "step3", "step4", "step6"
      @home_loan = id.nil? ? HomeLoan.new : get_home_loan(id)
      return redirect_to home_loan_path("step2") unless @home_loan.otp_verified
      @home_loan_offer =  @home_loan.home_loan_offer.try(:id) ? @home_loan.home_loan_offer : HomeLoanOffer.new
    when "step5"
      @home_loan = id.nil? ? HomeLoan.new : get_home_loan(id)
      @banks = @home_loan.banks
      return redirect_to home_loan_path("step2") unless @home_loan.otp_verified
    when "step7"
      @home_loan = get_home_loan(id) #HomeLoan.last
      session[:home_loan_id] = nil
    end
    render_wizard
  end

  def create_otp
    @home_loan.reference_number = "HOL#{(rand*100000000).to_i}"
    create_update_home_loan(@home_loan.save, "New Car Loan created successfully.", home_loan_path("step2"))
  end

  def update_otp_status
    @home_loan = get_home_loan(session[:home_loan_id])
    if !@home_loan.otp.eql?(params[:home_loan][:otp])
      @home_loan.otp_verified = true
      @home_loan.save
      flash[:error] = "The entered OTP verified successfully."
      redirect_to home_loan_path("step3")
    else
      flash[:error] = "The entered OTP is not valid."
      redirect_to home_loan_path("step2")
    end
  end

  def update
    create_update_home_loan(@update_status_ncl, "New Car Loan updated successfully.", home_loan_path("step4"))
  end

  def select_bank
    create_update_home_loan(@update_status_ncl, "New Car Loan updated successfully.", home_loan_path("step6"))
  end

  def create_home_offer
    create_update_home_loan_offer(@home_loan_offer.save, "New Car Loan offer applied successfully.", home_loan_path("step5"))
  end

  def update_home_offer
    create_update_home_loan_offer(@update_status_nclo, "New Car Loan offer applied successfully.", home_loan_path("step5"))
  end

  def update_home_assets
    session[:home_loan_id] = nil if @update_status_ncl
    create_update_home_loan(@update_status_ncl, "New Car Loan updated successfully.", home_loan_path("step7"))
  end

  private
  def home_loan_params
    params.require(:home_loan).permit(:first_name,
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

  def home_loan_offer_params
    params.require(:home_loan_offer).permit(:land_type,
      :property_type,
      :property_cost,
      :property_state,
      :property_city,
      :current_employment,
      :annual_income,
      :current_emi)
  end

  def home_loan_assets_params
    params.require(:home_loan).permit(:persoanl_bank_statement,
      :business_bank_statement,
      :id_proof,
      :salary_slip,
      :itr_copy,
      :passport_photo)    
  end

  def get_home_loan(id)
    @home_loan = HomeLoan.find(id)
  end

  def create_home_loan
    @home_loan = HomeLoan.new(home_loan_params)
  end

  def update_home_loan
    @update_status_ncl = get_home_loan(session[:home_loan_id]).update_attributes(home_loan_params)
  end

  def apply_loan
    get_home_loan(session[:home_loan_id])
    @home_loan.home_loan_bank_id = params[:home_loan_bank][:id]
    @update_status_ncl = @home_loan.save
  end

  def create_home_loan_offer
    get_home_loan(session[:home_loan_id])
    @home_loan_offer = HomeLoanOffer.new(home_loan_offer_params)
    @home_loan_offer.home_loan_id = @home_loan.id
  end

  def update_home_loan_offer
    get_home_loan(session[:home_loan_id])
    @update_status_nclo = @home_loan.home_loan_offer.update_attributes(home_loan_offer_params)
  end


  def update_home_loan_assets
    get_home_loan(session[:home_loan_id])
    @update_status_ncl = @home_loan.update_attributes(home_loan_assets_params)
  end

  def create_update_home_loan(status, message, path)
    if status
      session[:home_loan_id] = @home_loan.id
      unless @home_loan.otp_verified
        sms = SmsService.new
        @home_loan.otp = 1234
        @home_loan.save
        sms.send_otp(@home_loan)
      end
      flash[:notice] = message
      redirect_to path
    else
      render "home_loan/step1"
    end
  end
  
  def create_update_home_loan_offer(status, message, path)
    if status
      flash[:notice] = message
      redirect_to path
    else
      render "home_loan/step2"
    end
  end
end
