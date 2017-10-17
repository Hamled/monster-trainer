class Species < ApplicationRecord
  validates :name, presence: true, length: { minimum: 2 }
  validates :species_type, presence: true
end
