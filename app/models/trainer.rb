class Trainer < ApplicationRecord
  has_many :monsters

  validates :name, presence: true
  validates :trainer_class, presence: true

  # Capture a wild monster, optionally giving it a nickname
  def capture!(monster, nickname: nil)
    # Set the nickname (will unset existing value if nickname is not given)
    monster.nickname = nickname

    # Add the monster to our collection
    monsters << monster
  end
end
