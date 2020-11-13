class LoanAgainstPropertyBank < ApplicationRecord
  has_one_attached :bank_image
  has_one :loan_against_property
  has_one :loan_against_property_bank_info  
end
