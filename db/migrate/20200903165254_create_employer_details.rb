class CreateEmployerDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :employer_details do |t|
      t.integer :personal_loan_id
      t.string :employer_name
      t.string :designation
      t.string :years_in_current_job
      t.text :office_address_line1
      t.text :office_address_line2
      t.text :landmark
      t.string :office_state
      t.string :office_city
      t.string :office_email
      t.string :office_pincode
      t.integer :mailing_address
      t.string :first_name
      t.string :last_name
      t.string :mobile_number
      t.string :ref_mobile_number
      t.integer :salary_bank_account_name
      t.string :branch_name
      t.decimal :monthly_net_salary, precision: 20, scale: 2
      t.decimal :current_emi, precision: 20, scale: 2
      t.timestamps
    end
  end
end
