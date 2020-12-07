class NewCarLoan < ApplicationRecord
  has_one_attached :aadhar_back
  has_one_attached :aadhar_front
  has_one :new_car_loan_offer
  belongs_to :new_car_loan_bank, optional: true

  def banks
  	return NewCarLoanBank.all
  end

end
