class CustomLoanAgainstProperty < ApplicationRecord
  def loan_reasons
    [
      ['-Select Loan Purpose-',''],
      ['Business Expansion', '0'],
      ['Other', '2']
    ]
  end
end
