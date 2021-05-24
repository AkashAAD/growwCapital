class CustomCreditCard < ApplicationRecord
  def loan_purpose
    [
      ['-Select Purpose-',''],
      ['International Holiday', '0'],
      ['Business Travel','1'],
      ['Spouse or Child', '2'],
      ['Online Shopping', '3'],
      ['Maximum Revert Point', '4'],
      ['Personal Use', '5'],
      ['Other', '6']
    ]
  end
end
