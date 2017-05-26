#
# A room within a shelter building, where a family can be placed.   Units have
# more than one bed, but those beds are not individually tracked.
# This is only used for families with children placement, since adults are
# placed in individual beds.
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
class Unit < Place
end
