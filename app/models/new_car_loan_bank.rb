class NewCarLoanBank < ApplicationRecord
  has_one :new_car_loan
  has_one_attached :bank_image
  has_one :new_car_loan_bank_info
end
