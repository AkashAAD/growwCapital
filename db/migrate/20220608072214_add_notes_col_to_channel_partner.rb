class AddNotesColToChannelPartner < ActiveRecord::Migration[5.2]
  def change
    add_column :login_entries, :notes, :text
  end
end
