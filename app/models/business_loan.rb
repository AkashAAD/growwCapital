class BusinessLoan < ApplicationRecord
  has_one_attached :aadhar_card_front
  has_one_attached :aadhar_card_back
  has_one_attached :shockup_licence

  belongs_to :business_loan_bank, optional: true
  has_one :business_loan_offer


  def banks
  	# if self.annual_turnover == 1
   #    return BusinessLoanBank.where("slug IN (?)", ['hero_fincorp', 'fullerton_india', 'idfc_first_bank', 'neogrowth_finance'])
  	# else
  	return BusinessLoanBank.all
  	# end
  end

end
