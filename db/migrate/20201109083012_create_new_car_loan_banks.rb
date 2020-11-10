class CreateNewCarLoanBanks < ActiveRecord::Migration[5.2]
  def change
    create_table :new_car_loan_banks do |t|
      t.string :name
      t.string :slug
      t.timestamps
    end
  end
end
