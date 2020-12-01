class CreateBusinessLoans < ActiveRecord::Migration[5.2]
  def change
    create_table :business_loans do |t|
      t.decimal :loan_amount, precision: 20, scale: 2
      t.integer :tenure
      t.string :email
      t.string :mobile_number
      t.string :full_name
      t.integer :annual_turnover
      t.decimal :gross_annual_profit, precision: 20, scale: 2
      t.integer :company_type
      t.integer :business_nature
      t.decimal :current_emi, precision: 20, scale: 2
      t.text :address
      t.string :city
      t.string :pincode
      t.text :business_address
      t.string :business_city
      t.string :business_pincode
      t.datetime :dob
      t.integer :otp
      t.integer :bank_name
      t.boolean :otp_verified, default: false
      t.string :reference_number
      t.boolean :terms_and_conditions
      t.integer :business_loan_bank_id
      t.string :status
      t.timestamps
    end
    add_index :business_loans, :business_loan_bank_id
  end
end
