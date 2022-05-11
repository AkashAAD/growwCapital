class CreateChannelPartners < ActiveRecord::Migration[5.2]
  def change
    create_table :channel_partners do |t|
      t.string :full_name
      t.string :code
      t.timestamps
    end
  end
end
