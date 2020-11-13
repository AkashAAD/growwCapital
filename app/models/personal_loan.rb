class PersonalLoan < ApplicationRecord
  has_one_attached :id_proof
  has_one_attached :address_proof
  has_one_attached :salary_slip
  has_one_attached :passport_photo
  has_one_attached :bank_statement
  has_one :employer_detail
  belongs_to :personal_loan_bank, optional: true

  def banks
  	salary = self.employer_detail.monthly_net_salary
  	if salary >= 15000 && salary <= 20000
      return PersonalLoanBank.where(slug: 'hero_fincorp')
  	elsif salary >= 20000 && salary <= 24000
      return PersonalLoanBank.where("slug IN (?)", ['hero_fincorp', 'fullerton_india'])
  	elsif salary >= 25000
  	  return PersonalLoanBank.all
  	end
  end

end
