class TransferHomeLoanController < ApplicationController
  before_action :create_transfer_home_loan, only: [:create_otp]
  before_action :update_transfer_home_loan, only: [:update]
  before_action :create_transfer_home_loan_offer, only: [:create_home_offer]
  before_action :update_transfer_home_loan_offer, only: [:update_home_offer, :update_address]
  before_action :update_transfer_home_loan_assets, only: [:update_home_assets]
  before_action :apply_loan, only: [:select_bank]  

  include Wicked::Wizard
  steps :step1, :step2, :step3, :step4, :step5, :step6, :step7

  def show
    # session[:transfer_home_loan_id] = nil
    id = session[:transfer_home_loan_id]
    case params[:id]
    when "step1"
      @transfer_home_loan = id.nil? ? TransferHomeLoan.new : get_transfer_home_loan(id)
    when "step2"
      @transfer_home_loan = id.nil? ? TransferHomeLoan.new : get_transfer_home_loan(id)
      return redirect_to transfer_home_loan_path("step1") if id.nil?
    when "step3", "step4"
      @transfer_home_loan = id.nil? ? TransferHomeLoan.new : get_transfer_home_loan(id)
      @banks = @transfer_home_loan.banks
      return redirect_to transfer_home_loan_path("step1") unless @transfer_home_loan.otp_verified
    when "step5"
      @transfer_home_loan = id.nil? ? TransferHomeLoan.new : get_transfer_home_loan(id)
      return redirect_to transfer_home_loan_path("step1") unless @transfer_home_loan.otp_verified
    when "step6"
      return redirect_to transfer_home_loan_path("step1") if id.nil?
      @transfer_home_loan = get_transfer_home_loan(id) #TransferHomeLoan.last
      LoanMailer.transfer_home_loan(@transfer_home_loan).deliver_later
      is_preapproved
      session[:transfer_home_loan_id] = nil
    end
    render_wizard
  end

  def create_otp
    @transfer_home_loan.reference_number = "THOL#{(rand*100000000).to_i}"
    unless @transfer_home_loan.otp_verified
      send_otp
    end
    if session[:transfer_home_loan_id]
      @transfer_home_loan.update_attributes(transfer_home_loan_params)
    else
      @transfer_home_loan.save
      session[:thl_mobile_number] = nil
    end
    session[:transfer_home_loan_id] = @transfer_home_loan.id
    # create_update_transfer_home_loan(@transfer_home_loan.save, "Home Loan created successfully.", transfer_home_loan_path("step2"))
  end

  def update_otp_status
    @transfer_home_loan = get_transfer_home_loan(session[:transfer_home_loan_id])
    if @transfer_home_loan.otp.eql?(params[:transfer_home_loan][:otp].to_i)
      @transfer_home_loan.otp_verified = true
      @transfer_home_loan.save
      flash[:notice] = "The entered OTP verified successfully."
      # redirect_to transfer_home_loan_path("step4")
    else
      flash[:error] = "The entered OTP is not valid."
      # redirect_to transfer_home_loan_path("step3")
    end
  end

  def update
    flash[:notice] = "Home Loan updated successfully."
    # create_update_transfer_home_loan(@update_status_ncl, "Home Loan updated successfully.", transfer_home_loan_path("step2"))
  end

  def select_bank
    create_update_transfer_home_loan(@update_status_ncl, "Home Loan updated successfully.", transfer_home_loan_path("step4"))
  end

  def create_home_offer
    create_update_transfer_home_loan_offer(@transfer_home_loan_offer.save, "Home Loan offer applied successfully.", transfer_home_loan_path("step5"))
  end

  def update_home_offer
    create_update_transfer_home_loan_offer(@update_status_nclo, "Home Loan offer applied successfully.", transfer_home_loan_path("step3"))
  end

  def update_address
    create_update_transfer_home_loan(@update_status_nclo, "Home Loan updated successfully.", transfer_home_loan_path("step5"))
  end

  def update_home_assets
    session[:transfer_home_loan_id] = nil if @update_status_ncl
    create_update_transfer_home_loan(@update_status_ncl, "Home Loan updated successfully.", transfer_home_loan_path("step6"))
  end

  def resend_otp
    @transfer_home_loan = get_transfer_home_loan(session[:transfer_home_loan_id])
    send_otp
  end

  private
  def transfer_home_loan_params
    params.require(:transfer_home_loan).permit(:foreclose_loan_amount,
      :desired_loan_amount,
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
      :home_loan_bank_id,
      :is_topup_amount,
      :status)
  end

  def transfer_home_loan_offer_params
    params.require(:transfer_home_loan_offer).permit(:land_type,
      :property_type,
      :property_cost,
      :property_state,
      :property_city,
      :current_employment,
      :annual_income,
      :current_emi)
  end

  def transfer_home_loan_assets_params
    params.require(:transfer_home_loan).permit(:persoanl_bank_statement,
      :business_bank_statement,
      :id_proof,
      :salary_slip,
      :itr_copy,
      :passport_photo)    
  end

  def get_transfer_home_loan(id)
    @transfer_home_loan = TransferHomeLoan.find(id)
  end

  def create_transfer_home_loan
    @transfer_home_loan = TransferHomeLoan.new(transfer_home_loan_params)
  end

  def update_transfer_home_loan
    @update_status_ncl = get_transfer_home_loan(session[:transfer_home_loan_id]).update_attributes(transfer_home_loan_params)
  end

  def apply_loan
    get_transfer_home_loan(session[:transfer_home_loan_id])
    @transfer_home_loan.transfer_home_loan_bank_id = params[:transfer_home_loan_bank][:id]
    @update_status_ncl = @transfer_home_loan.save
  end

  def create_transfer_home_loan_offer
    get_transfer_home_loan(session[:transfer_home_loan_id])
    @transfer_home_loan_offer = TransferHomeLoanOffer.new(transfer_home_loan_offer_params)
    @transfer_home_loan_offer.transfer_home_loan_id = @transfer_home_loan.id
  end

  def update_transfer_home_loan_offer
    get_transfer_home_loan(session[:transfer_home_loan_id])
    @update_status_nclo = @transfer_home_loan.update_attributes(transfer_home_loan_params)
    session[:thl_email] = nil
    session[:thl_full_name] = nil
  end


  def update_transfer_home_loan_assets
    get_transfer_home_loan(session[:transfer_home_loan_id])
    @update_status_ncl = @transfer_home_loan.update_attributes(transfer_home_loan_params)
  end

  def create_update_transfer_home_loan(status, message, path)
    if status
      session[:transfer_home_loan_id] = @transfer_home_loan.id
      flash[:notice] = message
      redirect_to path
    else
      render "transfer_home_loan/step1"
    end
  end
  
  def create_update_transfer_home_loan_offer(status, message, path)
    if status
      flash[:notice] = message
      redirect_to path
    else
      render "transfer_home_loan/step2"
    end
  end

  def send_otp
    sms = SmsService.new
    @transfer_home_loan.otp = (rand*1000000).to_i
    @transfer_home_loan.save
    sms.send_otp(@transfer_home_loan, "Home Loan")
  end

  def is_preapproved
    pre_approved_offer = PreApprovedOffer.find_by(mobile_no: @transfer_home_loan.mobile_number)
    if @transfer_home_loan.mobile_number != pre_approved_offer&.mobile_no
      pre_approved_offer = PreApprovedOffer.new(mobile_no: @transfer_home_loan.mobile_number,
        reference_number: "PREAPRO#{(rand*100000000).to_i}",
        first_name: @transfer_home_loan.full_name,
        last_name: @transfer_home_loan.full_name)
      pre_approved_offer.save
    end
  end
end
