class PaymentController < ApplicationController
  def friancise_application
    @friancise_application = ChannelPartnerPayment.where('email = ? AND mobile_number = ?', friancise_application_params[:email], friancise_application_params[:mobile_number]).first
    unless !@friancise_application.blank?
      @friancise_application = ChannelPartnerPayment.new(friancise_application_params)
      @friancise_application.save
    end

    PaymentMailer.friancise_application(@friancise_application.id).deliver_later
    flash[:success] = 'Thank you for applying to Growwcapital for friancise. Please kindly check your email address for further process.'
  end


  def create_channel_partner_order
    begin
      @order = Razorpay::Order.create(amount: params[:franchise][:amount].to_i * 100,
        currency: 'INR',
        receipt: "FRN_ORD_#{(rand*10000000000).to_i}")
      get_franchise(params[:franchise][:id])
    rescue => e
      flash[:error] = e.to_s
    end
  end

  def create_channel_partner_payment
    # get_franchise(params[:franchise][:id])
    get_franchise(params[:franchise_id])
    payment_details = Razorpay::Payment.fetch(params[:payment_id][:razorpay_payment_id])
    @franchise.update_attributes(payment_response: params[:payment_id], payment_details: payment_details)
  	render json: { status: 200 }
  end

  private
  def friancise_application_params
    params.require(:channel_partner_payment).permit(:first_name, :last_name, :email, :mobile_number)
  end

  def get_franchise(id)
    @franchise = ChannelPartnerPayment.find_by(id: id)
  end

end
