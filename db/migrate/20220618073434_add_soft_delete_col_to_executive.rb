class AddSoftDeleteColToExecutive < ActiveRecord::Migration[5.2]
  def change
    ActiveRecord::Base.connection.tables.each do |table|
      begin
        add_column table.to_sym, :soft_delete, :boolean, default: false
        add_column table.to_sym, :slug, :string
      rescue StandardError => e
        puts "#{e}"
      end
    end
  end
end
