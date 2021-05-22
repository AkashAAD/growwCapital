class CreateCustomUsedCarLoans < ActiveRecord::Migration[5.2]
  def change
    create_table :custom_used_car_loans do |t|
      t.string :full_name
      t.string :mobile_number
      t.string :email
      t.integer :loan_purpose
      t.timestamps
    end
  end
end
