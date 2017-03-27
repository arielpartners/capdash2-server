# An organization that operates one or more shelters within one of the five NYC
# boroughs.
class Provider < ApplicationRecord
  has_many :shelters

  validates :name, presence: true
end
