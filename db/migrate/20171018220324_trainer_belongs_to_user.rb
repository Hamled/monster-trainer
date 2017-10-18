class TrainerBelongsToUser < ActiveRecord::Migration[5.1]
  def change
    add_reference :trainers, :user, foreign_key: true
  end
end
