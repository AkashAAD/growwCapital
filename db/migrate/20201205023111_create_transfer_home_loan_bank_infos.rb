class CreateTransferHomeLoanBankInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :transfer_home_loan_bank_infos do |t|
      t.decimal :roi, precision: 20, scale: 2
			t.decimal :processing_fee, precision: 20, scale: 2
			t.text :preprocessing_charges
      t.integer :transfer_home_loan_bank_id
      t.timestamps
    end
    add_index :transfer_home_loan_bank_infos, :transfer_home_loan_bank_id, name: :tra_hm_ln_bank_id
  end
end
