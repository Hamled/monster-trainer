class CreateSpecies < ActiveRecord::Migration[5.1]
  def change
    create_table :species do |t|
      t.string :name, null: false
      t.string :species_type, null: false

      t.timestamps
    end
  end
end
