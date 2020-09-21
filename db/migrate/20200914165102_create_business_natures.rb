class CreateBusinessNatures < ActiveRecord::Migration[5.2]
  def change
    create_table :business_natures do |t|
      t.string :name
      t.timestamps
    end
  end
end
