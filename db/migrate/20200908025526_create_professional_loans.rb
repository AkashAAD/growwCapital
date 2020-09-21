class CreateProfessionalLoans < ActiveRecord::Migration[5.2]
  def change
    create_table :professional_loans do |t|
      t.decimal :loan_amount, precision: 20, scale: 2
      t.integer :current_employment
      t.integer :profession_type
      t.string :current_profession_since_year
      t.decimal :annual_income, precision: 20, scale: 2
      t.string :residence_city
      t.string :email
      t.string :mobile_number
      t.timestamps
    end
  end
end
