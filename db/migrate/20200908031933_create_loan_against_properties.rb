class CreateLoanAgainstProperties < ActiveRecord::Migration[5.2]
  def change
    create_table :loan_against_properties do |t|
      t.decimal :loan_amount, precision: 20, scale: 2
      t.integer :tenure
      t.string :email
      t.string :mobile_number
      t.string :property_city
      t.decimal :annual_income, precision: 20, scale: 2
      t.decimal :current_emi, precision: 20, scale: 2
      t.decimal :property_cost, precision: 20, scale: 2
      t.integer :employment_type
      t.string :full_name
      t.text :address
      t.string :city
      t.string :pincode
      t.datetime :dob
      t.integer :otp
      t.boolean :otp_verified, default: false
      t.string :reference_number
      t.boolean :terms_and_conditions
      t.integer :loan_against_property_bank_id
      t.string :status
      t.timestamps
    end
    add_index :loan_against_properties, :loan_against_property_bank_id
  end
end
