class TransferPersonalLoanBank < ApplicationRecord
  has_one_attached :bank_image
  has_one :transfer_personal_loan_info, class_name: 'TransferPersonalLoanBankInfo'
  has_one :transfer_personal_loan, class_name: 'TransferPersonalLoan'
end
