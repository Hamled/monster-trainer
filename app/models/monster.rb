class Monster < ApplicationRecord
  belongs_to :species
  belongs_to :trainer, required: false
end
