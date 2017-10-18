# Make sure we log to the terminal as well as log/development.log
Rails.logger = Logger.new(STDOUT)

# Create a trainer
sabrina = Trainer.create!(
  name: "Sabrina",
  trainer_class: "Gym Leader"
)

Rails.logger.info "Seeded trainer: Sabrina"

# Create some species
[
  { name: "Dratini", species_type: "Dragon" },
  { name: "Alakazam", species_type: "Psychic"},
  { name: "Typhlosion", species_type: "Fire" }
].each do |attrs|
  species = Species.create!(attrs)

  Rails.logger.info "Seeded species: #{species.name}"
end

# Create some captured monsters
[
  { species: "Alakazam", nickname: "Sabrina's Alakazam" },
  { species: "Typhlosion", nickname: "Sabrina's Typhlosion" }
].each do |attrs|
  monster = Monster.create!(
    species: Species.find_by(name: attrs[:species]),
  )

  sabrina.capture!(monster, nickname: attrs[:nickname])

  Rails.logger.info "Seeded captured monster: #{monster.name}"
end
