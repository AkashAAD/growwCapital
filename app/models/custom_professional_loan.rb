class CustomProfessionalLoan < ApplicationRecord
  def loan_purpose
    [
      ['-Select Loan Purpose-',''],
      ['Business Expansion', '0'],
      ['Other', '2']
    ]
  end
end
