class CreateHomeLoanOffers < ActiveRecord::Migration[5.2]
  def change
    create_table :home_loan_offers do |t|
      t.integer :home_loan_id
      t.string :land_type
      t.string :property_type
      t.decimal :property_cost, precision: 20, scale: 2
      t.string :property_city
      t.string :property_state
      t.integer :current_employment
      t.decimal :annual_income, precision: 20, scale: 2
      t.decimal :current_emi, precision: 20, scale: 2
      t.timestamps
    end
    add_index :home_loan_offers, :home_loan_id
  end
end
