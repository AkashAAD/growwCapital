class UsedCarLoanBank < ApplicationRecord
  has_one_attached :bank_image
  has_one :used_car_loan
  has_one :used_car_loan_bank_info
end
