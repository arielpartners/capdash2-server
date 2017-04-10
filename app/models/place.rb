class Place < ApplicationRecord
  belongs_to :compartment, polymorphic: true

end
