class LoanAgainstProperty < ApplicationRecord
  has_one_attached :persoanl_bank_statement
  has_one_attached :id_proof
  has_one_attached :salary_slip
  has_one_attached :itr_copy
  has_one_attached :property_photo
  has_one_attached :passport_photo
  has_one :loan_against_property_offer
  validates :current_emi, :full_name, :dob, :property_cost, :email, :property_type, :open_land, :constructed_property, presence: true
end
