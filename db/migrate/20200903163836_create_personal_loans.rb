class CreatePersonalLoans < ActiveRecord::Migration[5.2]
  def change
    create_table :personal_loans do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :gender
      t.integer :tenure
      t.string :marital_status
      t.integer :highest_qualification
      t.integer :no_of_dependent
      t.string :current_residency_since_year
      t.string :current_city_since_year
      t.string :pan_number
      t.integer :purpose_of_loan
      t.string :email
      t.datetime :dob
      t.text :address_line1
      t.text :address_line2
      t.text :landmark
      t.string :city
      t.string :state
      t.string :pincode
      t.integer :residential_type
      t.decimal :loan_amount, precision: 20, scale: 2
      t.string :mobile_number
      t.timestamps
    end
  end
end
