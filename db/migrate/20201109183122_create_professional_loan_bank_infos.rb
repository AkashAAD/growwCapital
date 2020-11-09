class CreateProfessionalLoanBankInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :professional_loan_bank_infos do |t|
      t.decimal :roi, precision: 20, scale: 2
      t.decimal :processing_fee, precision: 20, scale: 2
      t.integer :professional_loan_bank_id
      t.integer :professional_loan_id
      t.timestamps
    end
    add_index :professional_loan_bank_infos, :professional_loan_bank_id
    add_index :professional_loan_bank_infos, :professional_loan_id
  end
end
