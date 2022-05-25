class CreateDisbursements < ActiveRecord::Migration[5.2]
  def change
    create_table :disbursements do |t|
      t.datetime :disburse_date
      t.decimal :processing_fee, precision: 20, scale: 2
      t.decimal :disburse_amount, precision: 20, scale: 2
      t.decimal :roi, precision: 20, scale: 2
      t.decimal :bank_insurance, precision: 20, scale: 2
      t.boolean :bt_inhancement
      t.boolean :cc_apply
      t.boolean :insurance
      t.text :remark
      t.boolean :payment, default: false
      t.references :user, index: true
      t.references :login_entry, index: true

      t.timestamps
    end
  end
end
