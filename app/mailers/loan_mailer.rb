class LoanMailer < ApplicationMailer
  def personal_loan(loan)
  	@loan = loan
    mail(to: loan.email, subject: "Personal Loan Application")
  end

  def transfer_personal_loan(loan)
    @loan = loan
    mail(to: loan.email, subject: "Transfer Personal Loan Application")    
  end

  def business_loan(loan)
  	@loan = loan
    mail(to: loan.email, subject: "Business Loan Application")
  end

  def home_loan(loan)
  	@loan = loan
    mail(to: loan.email, subject: "Home Loan Application")
  end

  def transfer_home_loan(loan)
    @loan = loan
    mail(to: loan.email, subject: "Home Loan Application")
  end

  def new_car_loan(loan)
  	@loan = loan
    mail(to: loan.email, subject: "New Car Loan Application")    
  end

  def used_car_loan(loan)
  	@loan = loan
    mail(to: loan.email, subject: "Used Car Loan Application")
  end

  def loan_against_property(loan)
  	@loan = loan
    mail(to: loan.email, subject: "Loan Against Property Application")
  end

  def professional_loan(loan)
  	@loan = loan
    mail(to: loan.email, subject: "Professional Loan Application")
  end

  def credit_card(card)
    @card = card
    mail(to: card.email, subject: "Credit Card Application")
  end

  def instant_call(obj)
    @instant_call = obj
    message = "Dear Customer, you have successfully applied for #{obj.product_name.split("_").map(&:capitalize).join(" ")}. Our growwcapital support executive will reach you soon."
    sent_refer_earn_sms(message, obj.mobile_number)
    mail(to: "support@growwcapital.com", subject: "Instant Application")
  end

  def refer_earn_admin(obj)
    @refer_earn = obj
    message = "Dear Customer, you have been refer by #{obj.full_name} for #{obj.product_name.split("_").map(&:capitalize).join(" ")}. Our growwcapital support executive will reach you soon."
    sent_refer_earn_sms(message, obj.mobile_number)
    mail(to: "support@growwcapital.com", subject: "Refer & Earn")
  end

  def refer_earn_customer(obj)
    @refer_earn = obj
    message = "Dear Customer, you have referred to #{obj.referer_full_name} for #{obj.product_name.split("_").map(&:capitalize).join(" ")}. Thank you for reaching out growwcapital."
    sent_refer_earn_sms(message, obj.referer_mobile_number)
    mail(to: "support@growwcapital.com", subject: "Refer & Earn")
  end

  def instant_application(application, product)
    @application = application
    @product = product
    @loan_purpose = @application.loan_reasons[@application.loan_purpose + 1][0]

    sms = SmsService.new
    sms.instant_application(@application, product, @loan_purpose)
    mail(to: "support@growwcapital.com", subject: "Application by executive")
  end

  def sent_refer_earn_sms(message, mob_number)
    sms = SmsService.new
    sms.refer_earn_sms(mob_number, message)
  end
end
