class CreateTransferPersonalLoanBankInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :transfer_personal_loan_bank_infos do |t|
      t.decimal :roi, precision: 20, scale: 2
			t.decimal :processing_fee, precision: 20, scale: 2
			t.text :preprocessing_charges
      t.integer :transfer_personal_loan_bank_id
      t.timestamps
    end
    add_index :transfer_personal_loan_bank_infos, :transfer_personal_loan_bank_id, name: :tr_pl_loan_bank_id
  end
end
