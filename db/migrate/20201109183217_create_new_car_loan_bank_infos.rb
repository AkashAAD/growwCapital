class CreateNewCarLoanBankInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :new_car_loan_bank_infos do |t|
      t.decimal :roi, precision: 20, scale: 2
			t.decimal :processing_fee, precision: 20, scale: 2
			t.text :preprocessing_charges
      t.integer :new_car_loan_bank_id
      t.timestamps
    end
    add_index :new_car_loan_bank_infos, :new_car_loan_bank_id
  end
end
