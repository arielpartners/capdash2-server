#
# A shelter bed where a client can be placed.
# This is only used for adult placement,
# since adults are placed in individual beds.
# By contrast, families are placed in units.
# Individual beds within family units are not tracked separately,
# rather the unit simply records the number of beds present within a unit.
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
class Bed < Place
  after_initialize :ensure_bed_count
  validate :only_one_bed

  private

  def ensure_bed_count
    self.bed_count = 1
  end

  def only_one_bed
    errors.add(:bed_count, 'must equal 1') unless bed_count == 1
  end
end
