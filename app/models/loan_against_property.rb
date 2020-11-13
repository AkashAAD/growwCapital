class LoanAgainstProperty < ApplicationRecord
  has_one_attached :persoanl_bank_statement
  has_one_attached :id_proof
  has_one_attached :salary_slip
  has_one_attached :itr_copy
  has_one_attached :property_photo
  has_one_attached :passport_photo
  has_one :loan_against_property_offer
  belongs_to :loan_against_property_bank, optional: true

  def banks
  	if ['rl', 'natp'].include?(self.loan_against_property_offer.land_type) && self.loan_against_property_offer.property_type == 'flat'
      return LoanAgainstPropertyBank.where("slug IN (?)", ['hdfc_housing', 'icici_housing', 'lic_housing', 'sbi_bank', 'idfc_first_bank', 'axis_bank', 'idbi_bank', 'indiabulls_bank'])
    elsif ['na'].include?(self.loan_against_property_offer.land_type) && self.loan_against_property_offer.property_type == 'plot'
      return LoanAgainstPropertyBank.where("slug IN (?)", ['aadhar_housing', 'aawas_housing', 'equitas_bank', 'utkarsh_small_bank', 'bankdhan_bank', 'idbi_bank', 'indiabulls_bank'])
    elsif ['gramin'].include?(self.loan_against_property_offer.land_type)
   	  return LoanAgainstPropertyBank.where("slug IN (?)", ['aadhar_housing', 'aawas_housing', 'equitas_bank', 'utkarsh_small_bank', 'aditya_birla'])
    else
      return LoanAgainstPropertyBank.all
    end
  end
end
