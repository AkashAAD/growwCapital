class CreateBusinessEmploymentTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :business_employment_types do |t|
      t.string :name 
      t.timestamps
    end
  end
end
