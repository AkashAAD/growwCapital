class CustomNewCarLoan < ApplicationRecord
  def loan_purpose
    [
      ['-Select Loan Purpose-',''],
      ['New Car', '0'],
      ['Other', '1']
    ]
  end
end
