class CustomTransferHomeLoan < ApplicationRecord
  def loan_purpose
    [
      ['-Select Loan Purpose-',''],
      ['Lower rate of interest', '0'],
      ['Top-Up Home Loan', '1'],
      ['Other', '2']
    ]
  end
end
