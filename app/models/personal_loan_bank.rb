class PersonalLoanBank < ApplicationRecord
  has_one_attached :bank_image
  has_one :personal_loan_info, class_name: 'PersonalLoanBankInfo'
  has_one :transfer_personal_loan_info, class_name: 'TransferPersonalLoanBankInfo'
  has_one :personal_loan, class_name: 'PersonalLoan'
  has_one :transfer_personal_loan, class_name: 'TransferPersonalLoan'
end
