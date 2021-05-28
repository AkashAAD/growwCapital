class CustomInsurance < ApplicationRecord
  def loan_purpose
    [
      ['-Select Insurance Purpose-',''],
      ['Car Insurance', '0'],
      ['Bike Insurance', '1'],
      ['Health Insurance', '2'],
      ['Other', '3']
    ]
  end
end
