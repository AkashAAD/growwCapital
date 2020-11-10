class CreateBusinessLoanBankInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :business_loan_bank_infos do |t|
      t.decimal :roi, precision: 20, scale: 2
      t.decimal :processing_fee, precision: 20, scale: 2
      t.integer :business_loan_bank_id
      t.timestamps
    end
    add_index :business_loan_bank_infos, :business_loan_bank_id
  end
end
