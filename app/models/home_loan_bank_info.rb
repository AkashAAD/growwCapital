class HomeLoanBankInfo < ApplicationRecord
  belongs_to :home_loan, optional: true
  belongs_to :home_loan_bank, optional: true
end
