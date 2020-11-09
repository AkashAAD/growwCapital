class CreateLoanAgainstPropertyBankInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :loan_against_property_bank_infos do |t|
      t.decimal :roi, precision: 20, scale: 2
      t.decimal :processing_fee, precision: 20, scale: 2
      t.integer :loan_against_property_bank_id
      t.integer :loan_against_property_id
      t.timestamps
    end
    add_index :loan_against_property_bank_infos, :loan_against_property_bank_id, name: 'lapb_index'
    add_index :loan_against_property_bank_infos, :loan_against_property_id, name: 'lap_index'
  end
end
