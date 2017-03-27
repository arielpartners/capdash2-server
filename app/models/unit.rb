# A room within a shelter building, especially for a family.   Units have more
# than one bed, but those beds are not individually tracked within CARES.
class Unit < ApplicationRecord
  belongs_to :shelter
  belongs_to :floor
end
