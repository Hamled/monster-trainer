class Trainer < ApplicationRecord
  validates :name, presence: true
  validates :trainer_class, presence: true
end
