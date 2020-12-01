class CreatePersonalLoans < ActiveRecord::Migration[5.2]
  def change
    create_table :personal_loans do |t|
      t.string :full_name
      t.string :employer_name
      t.integer :tenure
      t.decimal :monthly_net_salary, precision: 20, scale: 2
      t.string :email
      t.datetime :dob
      t.text :address
      t.string :city
      t.string :pincode
      t.text :office_address
      t.string :office_city
      t.string :office_pincode
      t.decimal :loan_amount, precision: 20, scale: 2
      t.string :mobile_number
      t.integer :otp
      t.boolean :otp_verified, default: false
      t.string :reference_number
      t.boolean :terms_and_conditions
      t.integer :personal_loan_bank_id
      t.integer :bank_name
      t.decimal :current_emi, precision: 20, scale: 2
      t.boolean :existing_card, default: false
      t.string :status
      t.timestamps
    end
    add_index :personal_loans, :personal_loan_bank_id
  end
end
