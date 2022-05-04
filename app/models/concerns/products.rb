module Products
  extend ActiveSupport::Concern

  def loan_types
    [
      ['-Select Product-',''],
      ['Credit Card', 'credit_card'],
      ['Personal Loan', 'personal_loan'],
      ['Transfer Personal Loan', 'transfer_personal_loan'],
      ['Business Loan', 'business_loan'],
      ['Professional Loan', 'professional_loan'],
      ['Home Loan', 'home_loan'],
      ['Transfer Home Loan', 'transfer_home_loan'],
      ['Loan Against Property', 'loan_against_property'],
      ['New Car Loan', 'new_car_loan'],
      ['Used Car Loan', 'used_car_loan'],
      ['Gold Loan', 'gold_loan'],
      ['Insurance', 'insurance'],
    ]    
  end
end
