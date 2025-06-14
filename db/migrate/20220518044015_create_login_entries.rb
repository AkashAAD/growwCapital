class CreateLoginEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :login_entries do |t|
      t.string :customer_full_name
      t.string :business_name
      t.string :email
      t.string :state
      t.string :city
      t.string :mobile_number
      t.datetime :process_date
      t.string :customer_id
      t.datetime :dob
      t.boolean :approved, default: false
      t.boolean :payment, default: false
      t.datetime :payment_date
      t.references :channel_partner, index: true
      t.references :channel_partner_product, index: true
      t.references :user, index: true
      t.references :executive, index: true
      t.references :bank, index: true
      t.timestamps
    end
  end
end
