class ProfessionalLoanBank < ApplicationRecord
  has_one_attached :bank_image
  belongs_to :professional_loan, optional: true
  has_one :professional_loan_bank_info, optional: true
end
