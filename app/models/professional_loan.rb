class ProfessionalLoan < ApplicationRecord
  has_one_attached :bank_statement
  has_one_attached :id_proof
  has_one_attached :residential_address_proof
  has_one_attached :degree
  has_one_attached :registration_certificate
  has_one_attached :office_address_proof
  has_one_attached :itr_copy
  has_one_attached :passport_photo
  has_one :professional_loan_offer
  belongs_to :professional_loan_bank, optional: true

  def banks
    info = ProfessionalLoanBankInfo.where(profession_id: self.professional_loan_offer.profession_type).pluck(:professional_loan_bank_id)
    return ProfessionalLoanBank.where("id in (?)", info)
  end

end
