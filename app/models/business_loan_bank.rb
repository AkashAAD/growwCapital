class BusinessLoanBank < ApplicationRecord
  has_one_attached :bank_image
  has_one :business_loan
  has_one :business_loan_bank_info
end
