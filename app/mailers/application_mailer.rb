class ApplicationMailer < ActionMailer::Base
  default from: 'support@growwcapital.com'
  layout 'mailer'

  def demo_mail
  	mail(to: "deshbhratarakash@gmail.com", subject: "This is a test")
  end

  def contact_us(contact)
    @contact = contact
    mail(to: "support@growwcapital.com", subject: "Contact Us mail")
  end

  def job_application(job_application)
    @job_application = job_application
    mail(to: "hr@growwcapital.com", subject: "Job Application mail", :cc => "dm@growwcapital.com")
  end

  def welcome_channel_partner(channel_partner)
    @channel_partner = channel_partner
    mail(to: @channel_partner.email, subject: "Welcome to GrowwCapital")
  end
end
