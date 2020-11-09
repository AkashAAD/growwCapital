class BusinessLoanBankInfo < ApplicationRecord
  belongs_to :business_loan, optional: true
  belongs_to :business_loan_bank, optional: true
end
