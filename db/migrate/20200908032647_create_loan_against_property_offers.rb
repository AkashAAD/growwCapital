class CreateLoanAgainstPropertyOffers < ActiveRecord::Migration[5.2]
  def change
    create_table :loan_against_property_offers do |t|
      t.integer :loan_against_propertie_id
      t.decimal :loan_amount, precision: 20, scale: 2
      t.integer :employment_type
      t.integer :city
      t.decimal :annual_income, precision: 20, scale: 2
      t.string :mobile_number
      t.timestamps
    end
  end
end
