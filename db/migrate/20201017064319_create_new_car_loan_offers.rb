class CreateNewCarLoanOffers < ActiveRecord::Migration[5.2]
  def change
    create_table :new_car_loan_offers do |t|
      t.integer :new_car_loan_id
      t.string :name
      t.timestamps
    end
  end
end
