class CustomUsedCarLoan < ApplicationRecord
  def loan_reasons
    [
      ['-Select Loan Purpose-',''],
      ['Used Car', '0'],
      ['Other', '1']
    ]
  end
end
