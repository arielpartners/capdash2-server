# a building that houses shelter units
class Building < ApplicationRecord
  has_many :units

  def bed_count
    self.units.sum(:beds)
  end
end
