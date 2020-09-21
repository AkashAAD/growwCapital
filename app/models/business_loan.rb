class BusinessLoan < ApplicationRecord
	has_one :business_loan_offer
	validates :loan_amount, :current_employment, :annual_turnover, :gross_annual_profit, :residence_city, :email, :mobile_number, presence: true
end
