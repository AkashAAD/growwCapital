class CustomHomeLoan < ApplicationRecord
  def loan_purpose
    [
      ['-Select Loan Purpose-',''],
      ['New Home Purchase', '0'],
      ['Old Construction Purchase', '1'],
      ['Top-Up Home Loan', '2'],
      ['Other', '3']
    ]
  end
end
