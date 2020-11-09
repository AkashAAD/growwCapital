class CreateNewCarLoanBanks < ActiveRecord::Migration[5.2]
  def change
    create_table :new_car_loan_banks do |t|
      t.string :name
      t.string :slug
      t.decimal :roi, precision: 20, scale: 2
      t.decimal :processing_fee, precision: 20, scale: 2
      t.timestamps
    end
  end
end
