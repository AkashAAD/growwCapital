class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.string :name
      t.decimal :joining_charge, precision: 20, scale: 2
      t.decimal :annual_charge, precision: 20, scale: 2
      t.timestamps
    end
  end
end
