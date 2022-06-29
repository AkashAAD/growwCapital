class AddColRejectedToLoginEntry < ActiveRecord::Migration[5.2]
  def change
    add_column :login_entries, :rejected, :boolean, default: false
  end
end
