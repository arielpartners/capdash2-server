#
# Abstract Base class for a place where a client gets a placement,
# either a {Bed} for single adults or adult families or
# {Unit} for families with children.
#
# == Schema Information
#
# Table name: places
#
#  id               :integer          not null, primary key
#  name             :string
#  type             :string
#  compartment_id   :integer
#  compartment_type :integer
#  bed_count        :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class Place < ApplicationRecord
  belongs_to :compartment, polymorphic: true
end
