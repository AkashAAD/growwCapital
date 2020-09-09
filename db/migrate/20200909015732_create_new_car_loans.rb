class CreateNewCarLoans < ActiveRecord::Migration[5.2]
  def change
    create_table :new_car_loans do |t|
      t.integer :registration_state
      t.integer :registration_city
      t.string :car_manufacturer
      t.string :car_make
      t.string :car_model
      t.string :current_residency_since_year
      t.integer :residence_type
      t.datetime :dob
      t.string :gender
      t.string :profession_status #salaied or self-employed
      t.integer :current_working_company
      t.integer :industry_type
      t.decimal :monthly_salary, precision: 20, scale: 2
      t.string :mobile_number
      t.string :first_name
      t.string :last_name
      t.string :email
      t.text :res_address_line1
      t.text :res_address_line2
      t.integer :res_state
      t.integer :res_city
      t.string :res_pincode
      t.text :office_address_line1
      t.text :office_address_line2
      t.integer :office_state
      t.integer :office_city
      t.string :office_pincode
      t.timestamps
    end
  end
end
