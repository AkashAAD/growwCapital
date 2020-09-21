class BusinessLoanOffer < ApplicationRecord
  has_one_attached :bank_statement
  has_one_attached :id_proof
  has_one_attached :residential_address_proof
  has_one_attached :office_address_proof
  has_one_attached :itr_copy
  has_one_attached :passport_photo
  belongs_to :business_loan
  validates :company_type, :business_nature, :industry_type, :business_years, :current_emi, :full_name, :gender, :pincode, :pancard, :dob, :is_rbi_offer, :residence_type, :city, presence: true
end
