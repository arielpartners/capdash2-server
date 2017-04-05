# floor belonging to a building
class Floor < Compartment
  has_many :units
  belongs_to :shelter_building
end
