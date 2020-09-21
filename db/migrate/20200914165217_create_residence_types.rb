class CreateResidenceTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :residence_types do |t|
      t.string :name
      t.timestamps
    end
  end
end
