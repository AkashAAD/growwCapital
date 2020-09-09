class CreateBusinessLoans < ActiveRecord::Migration[5.2]
  def change
    create_table :business_loans do |t|
      t.decimal :loan_amount, precision: 20, scale: 2
      t.integer :current_employment
      t.integer :annual_turnover
      t.decimal :gross_annual_profit, precision: 20, scale: 2
      t.integer :residence_city
      t.string :email
      t.string :mobile_number
      t.timestamps
    end
  end
end
