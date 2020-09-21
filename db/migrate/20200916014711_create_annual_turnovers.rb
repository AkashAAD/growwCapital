class CreateAnnualTurnovers < ActiveRecord::Migration[5.2]
  def change
    create_table :annual_turnovers do |t|
      t.string :name
      t.timestamps
    end
  end
end
