class TransferHomeLoan < ApplicationRecord
  has_one_attached :aadhar_front
  has_one_attached :aadhar_back
  belongs_to :home_loan_bank, optional: true

  def banks
    return HomeLoanBank.all
  end
end
