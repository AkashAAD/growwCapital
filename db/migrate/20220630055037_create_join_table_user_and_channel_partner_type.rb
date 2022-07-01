class CreateJoinTableUserAndChannelPartnerType < ActiveRecord::Migration[5.2]
  def change
    create_join_table :users, :channel_partner_types do |t|
      t.index :channel_partner_type_id
      t.index :user_id
    end

    add_reference :login_entries, :channel_partner_type, index: true
  end
end
