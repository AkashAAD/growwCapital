class CustomBusinessLoan < ApplicationRecord
  def loan_purpose
    [
      ['-Select Loan Purpose-',''],
      ['Business Expansion', '0'],
      ['Stock Purchase', '1'],
      ['Other', '2']
    ]
  end
end
