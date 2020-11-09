class NewCarLoanBankInfo < ApplicationRecord
  belongs_to :new_car_loan, optional: true
  belongs_to :new_car_loan_bank, optional: true  
end
