class NewCarLoanController < ApplicationController
  before_action :create_new_car_loan, only: [:create_otp]
  before_action :update_new_car_loan, only: [:update]
  before_action :create_new_car_loan_offer, only: [:create_new_car_offer]
  before_action :update_new_car_loan_offer, only: [:update_new_car_offer, :update_address]
  before_action :update_new_car_loan_assets, only: [:update_new_car_assets]
  before_action :apply_loan, only: [:select_bank]

  include Wicked::Wizard
  steps :step1, :step2, :step3, :step4, :step5, :step6, :step7

  def show
    id = session[:new_car_loan_id]
    case params[:id]
    when 'step1'
      step1(id)
    when 'step2'
      step2(id)
    when 'step3', 'step4'
      step34(id)
    when 'step5'
      step5(id)
    when 'step6'
      step6(id)
    end
    render_wizard
	end

  def create_otp
    @new_car_loan.reference_number = "NCL#{(rand * 100000000).to_i}"
    send_otp unless @new_car_loan.otp_verified

    if session[:new_car_loan_id]
      @new_car_loan.update!(new_car_loan_params)
    else
      @new_car_loan.save
      session[:ncl_mobile_number] = nil
    end

    session[:new_car_loan_id] = @new_car_loan.id
  end

  def update_otp_status
    @new_car_loan = get_new_car_loan(session[:new_car_loan_id])
    if @new_car_loan.otp.eql?(params[:new_car_loan][:otp].to_i)
      @new_car_loan.otp_verified = true
      @new_car_loan.save
      flash[:notice] = 'The entered OTP verified successfully.'
    else
      flash[:error] = 'The entered OTP is not valid.'
    end
  end

  def update
    flash[:notice] = 'New Car Loan updated successfully.'
  end

  def select_bank
    create_update_new_car_loan(
      @update_status_ncl,
      'New Car Loan bank selected successfully.',
      new_car_loan_path('step4')
    )
  end

  def create_new_car_offer
    create_update_new_car_loan_offer(
      @new_car_loan_offer.save,
      'New Car Loan offer applied successfully.',
      new_car_loan_path('step3')
    )
  end

  def update_new_car_offer
    create_update_new_car_loan_offer(
      @update_status_nclo,
      'New Car Loan offer applied successfully.',
      new_car_loan_path('step3')
    )
  end

  def update_address
    create_update_new_car_loan_offer(
      @update_status_nclo,
      'New Car Loan updated successfully.',
      new_car_loan_path('step5')
    )
  end

  def update_new_car_assets
    session[:new_car_loan_id] = nil if @update_status_ncl

    create_update_new_car_loan(
      @update_status_ncl,
      'New Car Loan updated successfully.',
      new_car_loan_path('step6')
    )
  end

  def resend_otp
    @new_car_loan = get_new_car_loan(session[:new_car_loan_id])
    send_otp
  end

  private

  def new_car_loan_params
    params.require(:new_car_loan).permit!
  end

  def new_car_loan_offer_params; end

  def new_car_loan_assets_params
    params.require(:new_car_loan).permit(
      :persoanl_bank_statement,
      :business_bank_statement,
      :id_proof,
      :salary_slip,
      :itr_copy,
      :passport_photo
    )
  end

  def get_new_car_loan(id)
    @new_car_loan = NewCarLoan.find(id)
  end

  def create_new_car_loan
    @new_car_loan = NewCarLoan.new(new_car_loan_params)
  end

  def update_new_car_loan
    @update_status_ncl = get_new_car_loan(
      session[:new_car_loan_id]
    ).update!(new_car_loan_params)
  end

  def apply_loan
    get_new_car_loan(session[:new_car_loan_id])
    @new_car_loan.new_car_loan_bank_id = params[:new_car_loan_bank][:id]
    @update_status_ncl = @new_car_loan.save
  end

  def create_new_car_loan_offer
    get_new_car_loan(session[:new_car_loan_id])
    @new_car_loan_offer = NewCarLoanOffer.new(new_car_loan_offer_params)
    @new_car_loan_offer.new_car_loan_id = @new_car_loan.id
  end

  def update_new_car_loan_offer
    get_new_car_loan(session[:new_car_loan_id])
    @update_status_nclo = @new_car_loan.update!(new_car_loan_params)
    session[:ncl_full_name] = nil
    session[:ncl_email] = nil
  end

  def update_new_car_loan_assets
    get_new_car_loan(session[:new_car_loan_id])
    @update_status_ncl = @new_car_loan.update!(new_car_loan_assets_params)
  end

  def create_update_new_car_loan(status, message, path)
    if status
      session[:new_car_loan_id] = @new_car_loan.id
      flash[:notice] = message
      redirect_to path
    else
      render 'new_car_loan/step1'
    end
  end

  def create_update_new_car_loan_offer(status, message, path)
    if status
      flash[:notice] = message
      redirect_to path
    else
      render 'new_car_loan/step2'
    end
  end

  def send_otp
    sms = SmsService.new
    @new_car_loan.otp = (rand * 1000000).to_i
    @new_car_loan.save
    sms.send_otp(@new_car_loan, 'New Car Loan')
  end

  def is_preapproved
    pre_approved_offer = PreApprovedOffer.find_by(mobile_no: @new_car_loan.mobile_number)
    return if @new_car_loan.mobile_number == pre_approved_offer&.mobile_no

    pre_approved_offer = PreApprovedOffer.new(
      mobile_no: @new_car_loan.mobile_number,
      reference_number: "PREAPRO#{(rand * 100000000).to_i}",
      first_name: @new_car_loan.full_name,
      last_name: @new_car_loan.full_name
    )
    pre_approved_offer.save!
  end

  def step1(id)
    @new_car_loan = id.nil? ? NewCarLoan.new : get_new_car_loan(id)
  end

  def step2(id)
    @new_car_loan = id.nil? ? NewCarLoan.new : get_new_car_loan(id)
    return redirect_to new_car_loan_path('step1') if id.nil?
  end

  def step34(id)
    @new_car_loan = id.nil? ? NewCarLoan.new : get_new_car_loan(id)
    @banks = @new_car_loan.banks
    return redirect_to new_car_loan_path('step1') unless @new_car_loan.otp_verified
  end

  def step5(id)
    @new_car_loan = id.nil? ? NewCarLoan.new : get_new_car_loan(id)
    return redirect_to new_car_loan_path('step1') unless @new_car_loan.otp_verified
  end

  def step6(id)
    return redirect_to new_car_loan_path('step1') if id.nil?

    @new_car_loan = get_new_car_loan(id)
    LoanMailer.new_car_loan(@new_car_loan).deliver_later
    is_preapproved
    session[:new_car_loan_id] = nil
  end
end
