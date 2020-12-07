class CreditCardController < ApplicationController

  before_action :create_credit_card, only: [:create_otp]
  before_action :update_credit_card, only: [:update]
  before_action :create_credit_card_offer, only: [:create_home_offer]
  before_action :update_credit_card_offer, only: [:update_card_offer, :update_address]
  before_action :update_credit_card_assets, only: [:update_card_assets]
  before_action :apply_loan, only: [:select_bank]  

  include Wicked::Wizard
  steps :step1, :step2, :step3, :step4, :step5, :step6, :step7

  def show
    # session[:credit_card_id] = nil
    id = session[:credit_card_id]
    case params[:id]
    when "step1"
      @credit_card = id.nil? ? CreditCard.new : get_credit_card(id)
    when "step2"
      @credit_card = id.nil? ? CreditCard.new : get_credit_card(id)
      return redirect_to credit_card_path("step1") if id.nil?
      return redirect_to credit_card_path("step3") if @credit_card.otp_verified
    when "step3"
      @credit_card = id.nil? ? CreditCard.new : get_credit_card(id)
      return redirect_to credit_card_path("step1") unless @credit_card.otp_verified
    when "step4", "step6"
      @credit_card = id.nil? ? CreditCard.new : get_credit_card(id)
      @cards = @credit_card.cards
      return redirect_to credit_card_path("step1") unless @credit_card.otp_verified
    when "step5"
      @credit_card = id.nil? ? CreditCard.new : get_credit_card(id)
      return redirect_to credit_card_path("step1") unless @credit_card.otp_verified
    when "step7"
      @credit_card = get_credit_card(id) #CreditCard.last
      LoanMailer.credit_card(@credit_card).deliver_later
      session[:credit_card_id] = nil
    end
    render_wizard
  end

  def create_otp
    @credit_card.reference_number = "CRD#{(rand*100000000).to_i}"
    unless @credit_card.otp_verified
      send_otp
    end
    create_update_credit_card(@credit_card.save, "Credit card application created successfully.", credit_card_path("step2"))
  end

  def update_otp_status
    @credit_card = get_credit_card(session[:credit_card_id])
    if !@credit_card.otp.eql?(params[:credit_card][:otp].to_i)
      @credit_card.otp_verified = true
      @credit_card.save
      flash[:notice] = "The entered OTP verified successfully."
      redirect_to credit_card_path("step3")
    else
      flash[:error] = "The entered OTP is not valid."
      redirect_to credit_card_path("step2")
    end
  end

  def update
    create_update_credit_card(@update_status_ncl, "Credit card application updated successfully.", credit_card_path("step2"))
  end

  def select_bank
    create_update_credit_card(@update_status_ncl, "Credit card application updated successfully.", credit_card_path("step5"))
  end

  def create_home_offer
    create_update_credit_card_offer(@credit_card_offer.save, "Credit card application offer applied successfully.", credit_card_path("step5"))
  end

  def update_card_offer
    create_update_credit_card_offer(@update_status_nclo, "Credit card application offer applied successfully.", credit_card_path("step4"))
  end

  def update_address
    create_update_credit_card(@update_status_nclo, "Credit card application updated successfully.", credit_card_path("step6"))
  end

  def update_card_assets
    session[:credit_card_id] = nil if @update_status_ncl
    create_update_credit_card(@update_status_ncl, "Credit card application updated successfully.", credit_card_path("step7"))
  end

  def resend_otp
    @credit_card = get_credit_card(session[:credit_card_id])
    send_otp
  end

  private
  def credit_card_params
    params.require(:credit_card).permit(:mobile_number,
      :otp,
      :otp_verified,
      :reference_number,
      :terms_and_conditions,
      :status,
      :employment_type,
      :email,
      :dob,
      :full_name,
      :existing_card,
      :card_id,
      :address,
      :city,
      :pincode,
      :office_address,
      :office_city,
      :office_pincode,
      :aadhar_front,
      :aadhar_back)
  end

  def get_credit_card(id)
    @credit_card = CreditCard.find(id)
  end

  def create_credit_card
    @credit_card = CreditCard.new(credit_card_params)
  end

  def update_credit_card
    @update_status_ncl = get_credit_card(session[:credit_card_id]).update_attributes(credit_card_params)
  end

  def apply_loan
    get_credit_card(session[:credit_card_id])
    @credit_card.card_id = params[:credit_card][:id]
    @update_status_ncl = @credit_card.save
  end

  def create_credit_card_offer
    get_credit_card(session[:credit_card_id])
    @credit_card_offer = CreditCardOffer.new(credit_card_offer_params)
    @credit_card_offer.credit_card_id = @credit_card.id
  end

  def update_credit_card_offer
    get_credit_card(session[:credit_card_id])
    @update_status_nclo = @credit_card.update_attributes(credit_card_params)
  end


  def update_credit_card_assets
    get_credit_card(session[:credit_card_id])
    @update_status_ncl = @credit_card.update_attributes(credit_card_params)
  end

  def create_update_credit_card(status, message, path)
    if status
      session[:credit_card_id] = @credit_card.id
      flash[:notice] = message
      redirect_to path
    else
      render "credit_card/step1"
    end
  end
  
  def create_update_credit_card_offer(status, message, path)
    if status
      flash[:notice] = message
      redirect_to path
    else
      render "credit_card/step2"
    end
  end

  def send_otp
    sms = SmsService.new
    @credit_card.otp = (rand*1000000).to_i
    @credit_card.save
    sms.send_otp(@credit_card, "Credit card application")
  end
end
