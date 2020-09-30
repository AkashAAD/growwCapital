class CreateProfessionalLoanOffers < ActiveRecord::Migration[5.2]
  def change
    create_table :professional_loan_offers do |t|
	    t.integer :professional_loan_id
      t.boolean :otp_status
      t.integer :bank_account_name
      t.decimal :current_emi, precision: 20, scale: 2
      t.string :full_name
      t.string :gender
      t.string :pincode
      t.string :pancard
      t.datetime :dob
      t.integer :residence_type
      t.timestamps
    end
  end
end
