class CreateProfessionalLoans < ActiveRecord::Migration[5.2]
  def change
    create_table :professional_loans do |t|
      t.decimal :loan_amount, precision: 20, scale: 2
      t.integer :tenure
      t.string :email
      t.string :mobile_number
      t.string :full_name
      t.integer :profession_type
      t.integer :degree
      t.integer :current_profession_since_year
      t.decimal :annual_income, precision: 20, scale: 2
      t.integer :bank_name
      t.decimal :current_emi, precision: 20, scale: 2
      t.text :address
      t.string :city
      t.string :pincode
      t.text :office_address
      t.string :office_city
      t.string :office_pincode
      t.datetime :dob
      t.integer :otp
      t.boolean :otp_verified, default: false
      t.string :reference_number
      t.boolean :terms_and_conditions
      t.integer :professional_loan_bank_id
      t.string :status
      t.timestamps
    end
    add_index :professional_loans, :professional_loan_bank_id
  end
end
