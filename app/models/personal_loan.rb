class PersonalLoan < ApplicationRecord
  has_one_attached :id_proof
  has_one_attached :address_proof
  has_one_attached :salary_slip
  has_one_attached :passport_photo
  has_one :employer_detail
  validates :first_name, :last_name, :gender, :marital_status, :highest_qualification, :no_of_dependent, :current_residency_since_year, :current_city_since_year, :pan_number, :purpose_of_loan, :qualification, :email, :address_line1, :address_line2, :address_line3, :city, :pincode, presence: true
end
