class UsedCarLoan < ApplicationRecord
  has_one_attached :persoanl_bank_statement
  has_one_attached :business_bank_statement
  has_one_attached :id_proof
  has_one_attached :salary_slip
  has_one_attached :car_registraion_certificate
  has_one_attached :car_photo
  has_one_attached :itr_copy
  has_one_attached :passport_photo
  has_one :used_car_loan_offer
  has_one :used_car_loan_bank
  has_one :used_car_loan_bank_info  
end
