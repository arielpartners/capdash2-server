#
# street address: currently supports only New York City Boroughs
# Could be used for non NYC if borough is left null
# @see schema.rb
#
class Address < ApplicationRecord
  has_one :shelter_building
  enum borough: { bronx: 1, brooklyn: 2, manhattan: 3, queens: 4,
                  staten_island: 5 }
end
