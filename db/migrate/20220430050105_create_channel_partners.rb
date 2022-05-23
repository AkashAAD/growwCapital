class CreateChannelPartners < ActiveRecord::Migration[5.2]
  def change
    create_table :channel_partners do |t|
      t.string :full_name
      t.string :firm_name
      t.string :email
      t.string :mobile_number
      t.string :code
      t.string :state
      t.string :city
      t.text :full_address
      t.datetime :onbording_date
      t.references :user, index: true

      t.timestamps
    end
  end
end
