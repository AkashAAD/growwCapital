class CreateTransferHomeLoans < ActiveRecord::Migration[5.2]
  def change
    create_table :transfer_home_loans do |t|
      t.decimal :foreclose_loan_amount, precision: 20, scale: 2, default: 0.00
      t.decimal :desired_loan_amount, precision: 20, scale: 2, default: 0.00
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
      t.integer :transfer_home_loan_bank_id
      t.string :status
      t.boolean :is_topup_amount, default: false
      t.timestamps
    end
    add_index :transfer_home_loans, :transfer_home_loan_bank_id
  end
end
