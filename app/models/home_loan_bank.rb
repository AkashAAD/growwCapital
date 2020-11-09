class HomeLoanBank < ApplicationRecord
  has_one_attached :bank_image
  belongs_to :home_loan, optional: true
  has_one :home_loan_bank_info
end
