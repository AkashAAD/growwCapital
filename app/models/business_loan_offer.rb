class BusinessLoanOffer < ApplicationRecord
  has_one_attached :bank_statement
  has_one_attached :id_proof
  has_one_attached :residential_address_proof
  has_one_attached :office_address_proof
  has_one_attached :itr_copy
  has_one_attached :passport_photo
  belongs_to :business_loan
end
