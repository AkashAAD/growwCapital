class CreateUsedCarLoans < ActiveRecord::Migration[5.2]
  def change
    create_table :used_car_loans do |t|
      t.string :registration_state
      t.string :registration_city
      t.string :car_manufacturer
      t.string :car_model
      t.string :car_registration_number
      t.string :model_year
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
      t.string :res_state
      t.string :res_city
      t.string :res_pincode
      t.text :office_address_line1
      t.text :office_address_line2
      t.string :office_state
      t.string :office_city
      t.string :office_pincode
      t.timestamps
    end
  end
end
