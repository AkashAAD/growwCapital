class BusinessLoan < ApplicationRecord
  belongs_to :business_loan_bank, optional: true
  has_one :business_loan_offer


  def banks
  	if self.business_loan_offer.annual_turnover == 1
      return BusinessLoanBank.where("slug IN (?)", ['hero_fincorp', 'fullerton_india', 'idfc_first_bank', 'neogrowth_finance'])
  	else
  	  return BusinessLoanBank.all
  	end
  end

end
