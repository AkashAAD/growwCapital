class CreateProfessionalLoans < ActiveRecord::Migration[5.2]
  def change
    create_table :professional_loans do |t|
    	t.string :mobile_number
    	t.boolean :otp_status
      t.integer :bank_account_name
      t.decimal :current_emi, precision: 20, scale: 2
      t.string :full_name
      t.string :gender
      t.string :pincode
      t.string :pancard
      t.datetime :dob
      t.string :is_rbi_offer
      t.integer :residence_type
      t.boolean :otp_status
      t.timestamps
    end
  end
end
