class AddColLoanAmountToLoginEntry < ActiveRecord::Migration[5.2]
  def change
    add_column :login_entries, :loan_amount, :decimal, precision: 20, scale: 2
  end
end
