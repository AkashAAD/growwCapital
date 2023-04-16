class CreateReferenceContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :reference_contacts do |t|
      t.string :full_name
      t.string :mobile_number
      t.string :profile
      t.references :login_entry, index: true
      t.timestamps
    end
  end
end
