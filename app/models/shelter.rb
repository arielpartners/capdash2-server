#
# A group of one or more buildings each of which having at least one unit
# designated for temporary overnight accommodation for homeless, excluding
# transitional and permanent housing.  DHS provides oversight for over 280
# public and private shelters.
# @see schema.rb
#
class Shelter < ApplicationRecord
  belongs_to :provider
  has_many :shelter_buildings
end
