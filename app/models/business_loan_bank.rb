class BusinessLoanBank < ApplicationRecord
  has_one_attached :bank_image
  belongs_to :business_loan, optional: true
  has_one :business_loan_bank_info
end
