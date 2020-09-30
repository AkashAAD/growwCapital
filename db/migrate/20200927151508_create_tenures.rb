class CreateTenures < ActiveRecord::Migration[5.2]
  def change
    create_table :tenures do |t|
      t.string :name
      t.timestamps
    end
  end
end
