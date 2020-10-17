class CreateLoanAgainstPropertyOffers < ActiveRecord::Migration[5.2]
  def change
    create_table :loan_against_property_offers do |t|
      t.integer :loan_against_property_id
      t.string :name
      t.timestamps
    end
  end
end
