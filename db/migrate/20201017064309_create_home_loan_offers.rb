class CreateHomeLoanOffers < ActiveRecord::Migration[5.2]
  def change
    create_table :home_loan_offers do |t|
      t.integer :home_loan_id
      t.string :name
      t.timestamps
    end
  end
end
