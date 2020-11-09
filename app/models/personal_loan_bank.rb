class PersonalLoanBank < ApplicationRecord
  has_one_attached :bank_image
  has_one :personal_loan_info
  belongs_to :personal_loan, optional: true
end
