class CustomNewCarLoan < ApplicationRecord
  def loan_reasons
    [
      ['-Select Loan Purpose-',''],
      ['New Car', '0'],
      ['Other', '1']
    ]
  end
end
