class EmployerDetail < ApplicationRecord
  belongs_to :personal_loan
  validates :employer_name, :office_state, :office_city, :office_pincode, :mailing_address, :first_name, :last_name, :mobile_number, :branch_name, presence: true
end
