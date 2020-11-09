class BusinessLoan < ApplicationRecord
  has_one :business_loan_bank
  has_one :business_loan_offer
  has_one :business_loan_bank_info
end
