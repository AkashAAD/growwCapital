class CreateEmployerDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :employer_details do |t|
      t.integer :personal_loan_id
      t.string :employer_name
      t.text :office_address_line1
      t.text :office_address_line2
      t.integer :office_state
      t.integer :office_city
      t.string :office_pincode
      t.integer :mailing_address
      t.string :first_name
      t.string :last_name
      t.string :mobile_number
      t.string :account_number
      t.string :branch_name
      t.timestamps
    end
  end
end
