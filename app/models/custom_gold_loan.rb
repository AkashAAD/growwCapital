class CustomGoldLoan < ApplicationRecord
  def loan_purpose
    [
      ['-Select Loan Purpose-',''],
      ['Personal Use', '0'],
      ['Stock Purchase', '1'],
      ['Other', '2']
    ]
  end
end
