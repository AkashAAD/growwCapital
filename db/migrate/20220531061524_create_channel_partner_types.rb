class CreateChannelPartnerTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :channel_partner_types do |t|
      t.string :name
      t.string :slug
      t.timestamps
    end

    add_reference :channel_partners, :channel_partner_type, index: true
    add_reference :users, :channel_partner_type, index: true
  end
end
