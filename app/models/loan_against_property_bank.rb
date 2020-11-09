class LoanAgainstPropertyBank < ApplicationRecord
  has_one_attached :bank_image
  belongs_to :loan_against_property, optional: true
  has_one :loan_against_property_bank_info  
end
