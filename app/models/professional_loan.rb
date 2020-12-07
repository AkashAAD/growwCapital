class ProfessionalLoan < ApplicationRecord
  has_one_attached :aadhar_back
  has_one_attached :aadhar_front
  has_one :professional_loan_offer
  belongs_to :professional_loan_bank, optional: true

  def banks
    info = ProfessionalLoanBankInfo.where(profession_id: self.profession_type).pluck(:professional_loan_bank_id)
    return ProfessionalLoanBank.where("id in (?)", info)
  end

end
