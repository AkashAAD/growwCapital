class CreateStayResidenceSinceYears < ActiveRecord::Migration[5.2]
  def change
    create_table :stay_residence_since_years do |t|
      t.string :name
      t.timestamps
    end
  end
end
