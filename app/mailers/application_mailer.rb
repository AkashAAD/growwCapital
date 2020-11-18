class ApplicationMailer < ActionMailer::Base
  default from: 'support@growwcapital.com'
  layout 'mailer'

  def demo_mail
  	mail(to: "rahulvairagade21@gmail.com", subject: "This is a test")
  end

  def contact_us(contact)
  	@contact = contact
  	mail(to: "support@growwcapital.com", subject: "Contact Us mail")
  end
end
