class CreateUsedCarLoanOffers < ActiveRecord::Migration[5.2]
  def change
    create_table :used_car_loan_offers do |t|
      t.integer :used_car_loan_id
      t.string :name
      t.timestamps
    end
  end
end
