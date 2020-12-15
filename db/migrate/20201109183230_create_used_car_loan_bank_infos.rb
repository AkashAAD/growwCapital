class CreateUsedCarLoanBankInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :used_car_loan_bank_infos do |t|
      t.decimal :roi, precision: 20, scale: 2
			t.decimal :processing_fee, precision: 20, scale: 2
			t.text :preprocessing_charges
      t.integer :used_car_loan_bank_id
      t.timestamps
    end
    add_index :used_car_loan_bank_infos, :used_car_loan_bank_id
  end
end
