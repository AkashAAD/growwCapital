class CreatePersonalLoanBankInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :personal_loan_bank_infos do |t|
      t.decimal :roi, precision: 20, scale: 2
      t.decimal :processing_fee, precision: 20, scale: 2
      t.integer :personal_loan_bank_id
      t.timestamps
    end
    add_index :personal_loan_bank_infos, :personal_loan_bank_id
  end
end
