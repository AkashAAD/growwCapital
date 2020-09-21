class ProfessionalLoan < ApplicationRecord
  has_one_attached :bank_statement
  has_one_attached :id_proof
  has_one_attached :residential_address_proof
  has_one_attached :degree
  has_one_attached :registration_certificate
  has_one_attached :office_address_proof
  has_one_attached :itr_copy
  has_one_attached :passport_photo
  has_one :professional_loan_offer
  validates :loan_amount, :current_employment, :profession_type, :current_profession_since_year, :annual_income, :residence_city, :email, :mobile_number, presence: true
end
