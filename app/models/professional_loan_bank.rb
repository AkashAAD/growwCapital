class ProfessionalLoanBank < ApplicationRecord
  has_one_attached :bank_image
  has_one :professional_loan
  has_one :professional_loan_bank_info
end
