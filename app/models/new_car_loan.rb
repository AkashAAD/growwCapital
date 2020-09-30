class NewCarLoan < ApplicationRecord
  has_one_attached :persoanl_bank_statement
  has_one_attached :business_bank_statement
  has_one_attached :id_proof
  has_one_attached :salary_slip
  has_one_attached :itr_copy
  has_one_attached :passport_photo
  validates :registration_state, :registration_city, :car_manufacturer, :car_make, :car_model, :current_residency_since_year, :residence_type, :dob, :gender, :profession_status, :current_working_company, :industry_type, :monthly_salary, :mobile_number, :first_name, :last_name, :email, presence: true
  # validates :res_address_line1, :res_address_line2, :res_state, :res_city, :res_pincode, :office_address_line1, :office_address_line2, :office_state, :office_city, :office_pincode, presence: true, on: :update
end
