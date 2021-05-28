class CustomUsedCarLoan < ApplicationRecord
  def loan_purpose
    [
      ['-Select Loan Purpose-',''],
      ['Used Car', '0'],
      ['Other', '1']
    ]
  end
end
