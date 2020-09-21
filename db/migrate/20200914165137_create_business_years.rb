class CreateBusinessYears < ActiveRecord::Migration[5.2]
  def change
    create_table :business_years do |t|
      t.string :name
      t.timestamps
    end
  end
end
