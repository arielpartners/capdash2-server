#
# Abstract Base class for a place where a client gets a placement,
# either a (@see Bed) for single adults or adult families or
# (@see Unit) for families with children.
# @see schema.rb
#
class Place < ApplicationRecord
  belongs_to :compartment, polymorphic: true
  # self.abstract_class = true
end
