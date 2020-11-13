class HomeLoan < ApplicationRecord
  has_one_attached :persoanl_bank_statement
  has_one_attached :id_proof
  has_one_attached :salary_slip
  has_one_attached :business_bank_statement
  has_one_attached :itr_copy
  has_one_attached :passport_photo
  has_one :home_loan_offer
  belongs_to :home_loan_bank

  def banks
  	if ['rl', 'natp'].include?(self.home_loan_offer.land_type) && self.home_loan_offer.property_type == 'flat'
      return HomeLoanBank.where("slug IN (?)", ['hdfc_housing', 'icici_housing', 'lic_housing', 'sbi_bank', 'idfc_first_bank', 'axis_bank', 'idbi_bank', 'indiabulls_bank'])
    elsif ['na'].include?(self.home_loan_offer.land_type) && self.home_loan_offer.property_type == 'plot'
      return HomeLoanBank.where("slug IN (?)", ['aadhar_housing', 'aawas_housing', 'equitas_bank', 'utkarsh_small_bank', 'bankdhan_bank', 'idbi_bank', 'indiabulls_bank'])
    elsif ['gramin'].include?(self.home_loan_offer.land_type)
   	  return HomeLoanBank.where("slug IN (?)", ['aadhar_housing', 'aawas_housing', 'equitas_bank', 'utkarsh_small_bank', 'aditya_birla'])
    else
      return HomeLoanBank.all
    end
  end

end
