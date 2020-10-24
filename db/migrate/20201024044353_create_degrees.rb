class CreateDegrees < ActiveRecord::Migration[5.2]
  def change
    create_table :degrees do |t|
      t.integer :profession_id
      t.string :name
      t.timestamps
    end
  end
end
