# floor belonging to a building
class Floor < ApplicationRecord
  has_many :units
  belongs_to :shelter_building
end
