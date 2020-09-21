class LoanAgainstPropertyOffer < ApplicationRecord
  belongs_to :loan_against_property
  validates :loan_amount, :employment_type, :city, :annual_income, :mobile_number, presence: true
end
