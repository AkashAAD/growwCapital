class AddColsToLoginEntry < ActiveRecord::Migration[5.2]
  def change
    add_column :disbursements, :aadhar_number, :string
    add_column :disbursements, :pan_number, :string
    add_column :disbursements, :net_salary, :decimal, precision: 20, scale: 2
    add_column :disbursements, :current_emi, :decimal, precision: 20, scale: 2
  end
end
