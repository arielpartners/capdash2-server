# floor belonging to a building
class Floor < ApplicationRecord
  has_many :places, as: :compartment
  belongs_to :shelter_building
end
