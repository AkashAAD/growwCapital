class CreateMailingAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :mailing_addresses do |t|
      t.string :name
      t.timestamps
    end
  end
end
