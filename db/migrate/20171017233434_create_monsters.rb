class CreateMonsters < ActiveRecord::Migration[5.1]
  def change
    create_table :monsters do |t|
      t.belongs_to :species, null: false
      t.string :nickname
      t.belongs_to :trainer

      t.timestamps
    end
  end
end
