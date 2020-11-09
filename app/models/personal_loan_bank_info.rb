class PersonalLoanBankInfo < ApplicationRecord
  belongs_to :personal_loan_bank, optional: true
  belongs_to :personal_loan, optional: true
end
