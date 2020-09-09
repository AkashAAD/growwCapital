class CreatePersonalLoans < ActiveRecord::Migration[5.2]
  def change
    create_table :personal_loans do |t|
      t.string :full_name
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.string :last_name
      t.string :marital_status
      t.integer :highest_qualification
      t.integer :no_of_dependent
      t.string :current_residency_since_year
      t.string :current_city_since_year
      t.string :pan_number
      t.integer :purpose_of_loan
      t.integer :qualification
      t.string :email
      t.text :address_line1
      t.text :address_line2
      t.text :address_line3
      t.integer :city
      t.string :pincode
      t.timestamps
    end
  end
end
