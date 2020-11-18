class CreateBusinessLoans < ActiveRecord::Migration[5.2]
  def change
    create_table :business_loans do |t|
      t.decimal :loan_amount, precision: 20, scale: 2
      t.integer :tenure
      t.string :email
      t.string :mobile_number
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :gender
      t.string :marital_status
      t.integer :highest_qualification
      t.integer :no_of_dependent
      t.string :current_residency_since_year
      t.string :current_city_since_year
      t.string :pan_number
      t.integer :purpose_of_loan
      t.text :address_line1
      t.text :address_line2
      t.text :landmark
      t.string :city
      t.string :state
      t.string :pincode
      t.integer :residential_type
      t.datetime :dob
      t.integer :otp
      t.boolean :otp_verified, default: false
      t.string :reference_number
      t.boolean :terms_and_conditions
      t.integer :business_loan_bank_id
      t.decimal :emi, precision: 20, scale: 2
      t.string :status
      t.timestamps
    end
    add_index :business_loans, :business_loan_bank_id
  end
end
