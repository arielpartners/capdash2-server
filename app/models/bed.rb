class Bed < Compartment
  belongs_to :compartment, polymorphic: true
end
