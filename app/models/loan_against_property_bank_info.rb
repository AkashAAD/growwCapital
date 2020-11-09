class LoanAgainstPropertyBankInfo < ApplicationRecord
  belongs_to :loan_against_property, optional: true
  belongs_to :loan_against_property_bank, optional: true
end
