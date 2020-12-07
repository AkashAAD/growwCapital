class CreateCarManufacturers < ActiveRecord::Migration[5.2]
  def change
    create_table :car_manufacturers do |t|
      t.string :name
      t.string :slug
      t.timestamps
    end
  end
end
