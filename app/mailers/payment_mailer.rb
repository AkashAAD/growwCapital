class PaymentMailer < ApplicationMailer
  def friancise_application(id)
    @friancise_application = ChannelPartnerPayment.find(id)
    file = File.join(Rails.root, 'francise_agreement.pdf')
    attachments['francise_agreement.pdf'] = File.read(file)
    mail(to: @friancise_application.email, subject: "Franchise Application")
  end
end
