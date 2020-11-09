class UsedCarLoanBank < ApplicationRecord
  has_one_attached :bank_image
  belongs_to :used_car_loan, optional: true
  has_one :used_car_loan_bank_info
end
