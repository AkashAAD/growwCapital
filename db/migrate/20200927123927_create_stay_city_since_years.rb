class CreateStayCitySinceYears < ActiveRecord::Migration[5.2]
  def change
    create_table :stay_city_since_years do |t|
      t.string :name
      t.timestamps
    end
  end
end
