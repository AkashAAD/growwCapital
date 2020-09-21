class HomeLoan < ApplicationRecord
  has_one_attached :persoanl_bank_statement
  has_one_attached :id_proof
  has_one_attached :salary_slip
  has_one_attached :business_bank_statement
  has_one_attached :itr_copy
  has_one_attached :passport_photo
  validates :loan_amount, :property_city, :annual_income, :mobile_number, :property_type, :property_cost, :current_employment, :current_emi, :full_name, :email, :dob, presence: true
end
