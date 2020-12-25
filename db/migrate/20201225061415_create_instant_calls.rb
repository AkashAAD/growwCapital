class CreateInstantCalls < ActiveRecord::Migration[5.2]
  def change
    create_table :instant_calls do |t|
      t.string :full_name
      t.string :mobile_number
      t.string :email
      t.string :city
      t.timestamps
    end
  end
end
