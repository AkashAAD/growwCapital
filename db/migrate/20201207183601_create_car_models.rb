class CreateCarModels < ActiveRecord::Migration[5.2]
  def change
    create_table :car_models do |t|
      t.string :name
      t.string :slug
      t.integer :car_manufacturer_id
      t.timestamps
    end
  end
end
