class ProfessionalLoanBankInfo < ApplicationRecord
  belongs_to :professional_loan_bank, optional: true
  belongs_to :professional_loan, optional: true
end
