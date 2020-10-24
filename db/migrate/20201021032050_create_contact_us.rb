class CreateContactUs < ActiveRecord::Migration[5.2]
  def change
    create_table :contact_us do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :subject
      t.text :message
      t.timestamps
    end
  end
end
