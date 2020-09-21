class CreateHomeLoanAmounts < ActiveRecord::Migration[5.2]
  def change
    create_table :home_loan_amounts do |t|
      t.string :name
      t.timestamps
    end
  end
end
