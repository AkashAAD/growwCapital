class CreateDependentNumbers < ActiveRecord::Migration[5.2]
  def change
    create_table :dependent_numbers do |t|
      t.string :name
      t.timestamps
    end
  end
end
