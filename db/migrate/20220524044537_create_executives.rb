class CreateExecutives < ActiveRecord::Migration[5.2]
  def change
    create_table :executives do |t|
      t.string :full_name
      t.string :code
      t.references :user
      t.timestamps
    end
  end
end
