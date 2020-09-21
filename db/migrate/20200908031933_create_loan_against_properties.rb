class CreateLoanAgainstProperties < ActiveRecord::Migration[5.2]
  def change
    create_table :loan_against_properties do |t|
      t.decimal :current_emi, precision: 20, scale: 2
      t.string :full_name
      t.datetime :dob
      t.decimal :property_cost, precision: 20, scale: 2
      t.string :email
      t.string :property_type
      t.string :constructed_property
      t.string :open_land
      t.timestamps
    end
  end
end
