class CreateHomeLoanTenures < ActiveRecord::Migration[5.2]
  def change
    create_table :home_loan_tenures do |t|
      t.string :name
      t.timestamps
    end
  end
end
