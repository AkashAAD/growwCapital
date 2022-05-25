class CreateChannelPartnerProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :channel_partner_products do |t|
      t.references :channel_partner, index: true
      t.references :product, index: true
      t.timestamps
    end
  end
end
