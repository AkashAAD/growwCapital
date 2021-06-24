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
    mail(to: "support@growwcapital.com", subject: "Instant Application")
  end

  def refer_earn(obj)
    @refer_earn = obj
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
end
