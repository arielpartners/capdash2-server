# floor belonging to a building
class Floor < Compartment
  has_many :units
  has_many :beds, as: :compartment
  belongs_to :shelter_building
end
