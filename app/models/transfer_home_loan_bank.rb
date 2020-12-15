class TransferHomeLoanBank < ApplicationRecord
  has_one_attached :bank_image
  has_one :transfer_home_loan
  has_one :transfer_home_loan_bank_info
end
