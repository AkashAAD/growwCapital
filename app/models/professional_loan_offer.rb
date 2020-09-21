class ProfessionalLoanOffer < ApplicationRecord
  belongs_to :professional_loan
  validates :bank_account_name, :current_emi, :full_name, :gender, :pincode, :pancard, :dob, :is_rbi_offer, :residence_type, presence: true
end
