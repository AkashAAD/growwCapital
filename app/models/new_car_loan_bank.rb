class NewCarLoanBank < ApplicationRecord
  belongs_to :new_car_loan, optional: true
  has_one_attached :bank_image
  has_one :new_car_loan_bank_info
end
