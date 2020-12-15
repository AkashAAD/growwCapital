class TransferPersonalLoan < ApplicationRecord
  has_one_attached :aadhar_front
  has_one_attached :aadhar_back
  belongs_to :transfer_personal_loan_bank, optional: true

  def banks
  	salary = self.monthly_net_salary
  	if salary >= 15000 && salary <= 20000
      return TransferPersonalLoanBank.where(slug: 'hero_fincorp')
  	elsif salary >= 20000 && salary <= 24000
      return TransferPersonalLoanBank.where("slug IN (?)", ['hero_fincorp', 'fullerton_india'])
  	elsif salary >= 25000
  	  return TransferPersonalLoanBank.all
  	end
  end
end
