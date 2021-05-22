class CustomPersonalLoan < ApplicationRecord
  def loan_purpose
    [
      ['-Select Loan Purpose-',''],
      ['Home Renovation', '0'],
      ['Marriage','1'],
      ['Travel', '2'],
      ['Education', '3'],
      ['Agriculture/ Farming', '4'],
      ['Personal Use', '5'],
      ['Other', '6']
    ]
  end
end
