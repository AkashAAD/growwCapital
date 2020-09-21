class CreateHomeLoans < ActiveRecord::Migration[5.2]
  def change
    create_table :home_loans do |t|
    	t.integer :loan_amount
    	t.string :property_city
      t.decimal :annual_income, precision: 20, scale: 2
      t.string :mobile_number
      t.string :property_type
      t.decimal :property_cost, precision: 20, scale: 2
      t.integer :current_employment
      t.decimal :current_emi, precision: 20, scale: 2
      t.string :full_name
      t.string :email
      t.datetime :dob
      t.timestamps
    end
  end
end
