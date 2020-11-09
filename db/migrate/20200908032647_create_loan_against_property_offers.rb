class CreateLoanAgainstPropertyOffers < ActiveRecord::Migration[5.2]
  def change
    create_table :loan_against_property_offers do |t|
      t.integer :loan_against_property_id
      t.integer :employment_type
      t.decimal :annual_income, precision: 20, scale: 2
      t.decimal :property_cost, precision: 20, scale: 2
      t.string :land_type      
      t.string :property_type
      t.decimal :buildup_area, precision: 20, scale: 2 #(in sq feet) only for flat, commertial_property, constructed_property
      t.string :property_city
      t.string :property_state
      t.decimal :current_emi, precision: 20, scale: 2
      t.timestamps
    end
    add_index :loan_against_property_offers, :loan_against_property_id
  end
end
