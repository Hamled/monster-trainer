class Trainer < ApplicationRecord
  has_many :monsters

  validates :name, presence: true
  validates :trainer_class, presence: true
end
