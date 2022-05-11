class CreateDisbursements < ActiveRecord::Migration[5.2]
  def change
    create_table :disbursements do |t|
      t.string :customer_full_name
      t.string :business_name
      t.string :email
      t.string :state
      t.string :city
      t.string :mobile_number
      t.string :product_name
      t.datetime :process_date
      t.datetime :disburse_date
      t.decimal :processing_fee, precision: 20, scale: 2
      t.decimal :disburse_amount, precision: 20, scale: 2
      t.decimal :roi, precision: 20, scale: 2
      t.decimal :bank_insurance, precision: 20, scale: 2
      t.boolean :bt_inhancement
      t.boolean :cc_apply
      t.boolean :insurance
      t.string :executive_full_name
      t.string :customer_id
      t.text :remark
      t.datetime :dob
      t.references :channel_partner, index: true

      t.timestamps
    end
  end
end
