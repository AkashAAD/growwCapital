class CreateQualifications < ActiveRecord::Migration[5.2]
  def change
    create_table :qualifications do |t|
      t.string :name
      t.timestamps
    end
  end
end
