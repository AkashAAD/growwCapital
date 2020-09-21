class CreateHighestQualifications < ActiveRecord::Migration[5.2]
  def change
    create_table :highest_qualifications do |t|
      t.string :name
      t.timestamps
    end
  end
end
