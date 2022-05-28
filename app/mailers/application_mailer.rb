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
    message = "Hi #{@channel_partner.full_name},%nCongratulations!%n"\
      "Your channel partner code has been generated successfully.%n"\
      "Your code is #{@channel_partner.code}%n"\
      "Please keep it with you for every transaction.%n"\
      "For any query we are here to support you.%n %n"\
      "Support Email: channelpartners@growwcapital.com%n"\
      "Support Number: 9112345687%n"\
      "Website Link: https://www.growwcapital.com"

    send_sms(message, channel_partner.mobile_number)
    mail(to: @channel_partner.email, subject: "Welcome to GrowwCapital")
  end

  private

  def send_sms(message, mob_number)
    sms = SmsService.new

    sms.channel_partner_registration(mob_number, message)
  end
end
