class LoanAgainstPropertyController < ApplicationController
  before_action :create_loan_against_property, only: [:create_otp]
  before_action :update_loan_against_property, only: [:update]
  before_action :create_loan_against_property_offer, only: [:create_against_property_offer]
  before_action :update_loan_against_property_offer, only: [:update_against_property_offer, :update_address]
  before_action :update_loan_against_property_assets, only: [:update_against_property_assets]
  before_action :apply_loan, only: [:select_bank]

  include Wicked::Wizard
  steps :step1, :step2, :step3, :step4, :step5, :step6, :step7

  def show
    # session[:loan_against_property_id] = nil
    id = session[:loan_against_property_id]
    case params[:id]
    when "step1"
      @loan_against_property = id.nil? ? LoanAgainstProperty.new : get_loan_against_property(id)
    when "step2"
      @loan_against_property = id.nil? ? LoanAgainstProperty.new : get_loan_against_property(id)
      return redirect_to loan_against_property_path("step1") if id.nil?
    when "step3", "step4"
      @loan_against_property = id.nil? ? LoanAgainstProperty.new : get_loan_against_property(id)
      @banks = @loan_against_property.banks
      return redirect_to loan_against_property_path("step1") unless @loan_against_property.otp_verified
    when "step5"
      @loan_against_property = id.nil? ? LoanAgainstProperty.new : get_loan_against_property(id)
      return redirect_to loan_against_property_path("step1") unless @loan_against_property.otp_verified
    when "step6"
      return redirect_to loan_against_property_path("step1") if id.nil?      
      @loan_against_property = get_loan_against_property(id) #LoanAgainstProperty.last
      LoanMailer.loan_against_property(@loan_against_property).deliver_later
      session[:loan_against_property_id] = nil
    end
    render_wizard
  end

  def create_otp
    @loan_against_property.reference_number = "LAP#{(rand*100000000).to_i}"
    unless @loan_against_property.otp_verified
      send_otp
    end
    if session[:loan_against_property_id]
      @loan_against_property.update_attributes(loan_against_property_params)
    else
      @loan_against_property.save
    end
    session[:loan_against_property_id] = @loan_against_property.id
    # create_update_loan_against_property(@loan_against_property.save, "New Loan Against Property created successfully.", loan_against_property_path("step2"))
  end

  def update_otp_status
    @loan_against_property = get_loan_against_property(session[:loan_against_property_id])
    if !@loan_against_property.otp.eql?(params[:loan_against_property][:otp].to_i)
      @loan_against_property.otp_verified = true
      @loan_against_property.save
      flash[:notice] = "The entered OTP verified successfully."
      # redirect_to loan_against_property_path("step4")
    else
      flash[:error] = "The entered OTP is not valid."
      # redirect_to loan_against_property_path("step3")
    end
  end

  def update
    flash[:notice] = "New Loan Against Property updated successfully."
    # create_update_loan_against_property(@update_status_ncl, "New Loan Against Property updated successfully.", loan_against_property_path("step2"))
  end

  def select_bank
    create_update_loan_against_property(@update_status_ncl, "New Loan Against Property bank selected successfully.", loan_against_property_path("step4"))
  end

  def create_against_property_offer
    create_update_loan_against_property_offer(@loan_against_property_offer.save, "New Loan Against Property offer applied successfully.", loan_against_property_path("step5"))
  end

  def update_against_property_offer
    create_update_loan_against_property_offer(@update_status_nclo, "New Loan Against Property offer applied successfully.", loan_against_property_path("step3"))
  end

  def update_address
    create_update_loan_against_property(@update_status_nclo, "Home Loan updated successfully.", loan_against_property_path("step5"))
  end  

  def update_against_property_assets
    session[:loan_against_property_id] = nil if @update_status_ncl
    create_update_loan_against_property(@update_status_ncl, "New Loan Against Property updated successfully.", loan_against_property_path("step6"))
  end

  def resend_otp
    @loan_against_property = get_loan_against_property(session[:loan_against_property_id])
    send_otp
  end

  private
  def loan_against_property_params
    params.require(:loan_against_property).permit(:loan_amount,
     :tenure,
     :email,
     :mobile_number,
     :property_city,
     :annual_income,
     :current_emi,
     :property_cost,
     :employment_type,
     :full_name,
     :address,
     :city,
     :pincode,
     :dob,
     :otp,
     :otp_verified,
     :reference_number,
     :terms_and_conditions,
     :status,
     :aadhar_front,
     :aadhar_back)
  end

  def loan_against_property_offer_params
    params.require(:loan_against_property_offer).permit(:employment_type,
      :annual_income,
      :property_cost,
      :land_type,
      :property_type,
      :commercial_property,
      :buildup_area,
      :property_state,
      :property_city,
      :current_emi)
  end

  def loan_against_property_assets_params
    params.require(:loan_against_property).permit(:persoanl_bank_statement,
      :business_bank_statement,
      :id_proof,
      :salary_slip,
      :itr_copy,
      :passport_photo)    
  end

  def get_loan_against_property(id)
    @loan_against_property = LoanAgainstProperty.find(id)
  end

  def create_loan_against_property
    @loan_against_property = LoanAgainstProperty.new(loan_against_property_params)
  end

  def update_loan_against_property
    @update_status_ncl = get_loan_against_property(session[:loan_against_property_id]).update_attributes(loan_against_property_params)
  end

  def apply_loan
    get_loan_against_property(session[:loan_against_property_id])
    @loan_against_property.loan_against_property_bank_id = params[:loan_against_property_bank][:id]
    @update_status_ncl = @loan_against_property.save
  end

  def create_loan_against_property_offer
    get_loan_against_property(session[:loan_against_property_id])
    @loan_against_property_offer = LoanAgainstPropertyOffer.new(loan_against_property_offer_params)
    @loan_against_property_offer.loan_against_property_id = @loan_against_property.id
  end

  def update_loan_against_property_offer
    get_loan_against_property(session[:loan_against_property_id])
    @update_status_nclo = @loan_against_property.update_attributes(loan_against_property_params)
  end


  def update_loan_against_property_assets
    get_loan_against_property(session[:loan_against_property_id])
    @update_status_ncl = @loan_against_property.update_attributes(loan_against_property_assets_params)
  end

  def create_update_loan_against_property(status, message, path)
    if status
      session[:loan_against_property_id] = @loan_against_property.id
      flash[:notice] = message
      redirect_to path
    else
      render "loan_against_property/step1"
    end
  end
  
  def create_update_loan_against_property_offer(status, message, path)
    if status
      flash[:notice] = message
      redirect_to path
    else
      render "loan_against_property/step2"
    end
  end

  def send_otp
    sms = SmsService.new
    @loan_against_property.otp = (rand*1000000).to_i
    @loan_against_property.save
    sms.send_otp(@loan_against_property, "Loan Against Property")
  end
end
