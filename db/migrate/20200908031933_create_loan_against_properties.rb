class CreateLoanAgainstProperties < ActiveRecord::Migration[5.2]
  def change
    create_table :loan_against_properties do |t|
      t.decimal :current_emi, precision: 20, scale: 2
      t.string :full_name
      t.datetime :dob
      t.decimal :property_cost, precision: 20, scale: 2
      t.string :email
      t.integer :property_type
      t.integer :constructed_property
      t.integer :open_land
      t.integer :property_type
      t.timestamps
    end
  end
end
