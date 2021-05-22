class CreateCustomTransferPersonalLoans < ActiveRecord::Migration[5.2]
  def change
    create_table :custom_transfer_personal_loans do |t|
      t.string :full_name
      t.string :mobile_number
      t.string :email
      t.integer :loan_purpose
      t.timestamps
    end
  end
end
