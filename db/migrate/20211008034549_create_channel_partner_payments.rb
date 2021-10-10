class CreateChannelPartnerPayments < ActiveRecord::Migration[5.2]
  def change
    create_table :channel_partner_payments do |t|
      t.string :first_name
      t.string :last_name
      t.string :mobile_number
      t.string :email
      t.json :payment_response
      t.json :payment_details
      t.timestamps
    end
  end
end
