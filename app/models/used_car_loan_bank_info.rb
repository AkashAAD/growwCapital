class UsedCarLoanBankInfo < ApplicationRecord
  belongs_to :used_car_loan_bank, optional: true
  belongs_to :used_car_loan, optional: true
end
