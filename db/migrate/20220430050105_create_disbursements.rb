class CreateDisbursements < ActiveRecord::Migration[5.2]
  def change
    create_table :disbursements do |t|
      t.string :customer_full_name
      t.string :business_name
      t.string :location
      t.string :mobile_number
      t.string :loan_type
      t.string :loan_amount
      t.decimal :annual_fee, precision: 20, scale: 2
      t.datetime :process_date
      t.datetime :disburse_date
      t.decimal :disburse_amount, precision: 20, scale: 2
      t.decimal :roi, precision: 20, scale: 2
      t.boolean :bt_inhancement
      t.boolean :cc_apply
      t.boolean :health_insurance
      t.string :executive_full_name
      t.string :channel_name
      t.string :customer_id
      t.text :remark
      t.datetime :dob

      t.timestamps
    end
  end
end
