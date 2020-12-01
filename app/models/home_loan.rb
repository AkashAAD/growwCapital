class HomeLoan < ApplicationRecord
  has_one_attached :aadhar_back
  has_one_attached :aadhar_front
  has_one :home_loan_offer
  belongs_to :home_loan_bank, optional: true

  def banks
    return HomeLoanBank.all
  end

end
