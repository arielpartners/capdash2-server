# floor belonging to a building
class Floor < ApplicationRecord
  has_many :places, as: :compartment
  belongs_to :shelter_building
  belongs_to :case_type
  belongs_to :program_type

  before_save :ensure_case_type, :ensure_program_type

  private

  def ensure_case_type
    self.case_type ||= shelter_building.case_type
  end

  def ensure_program_type
    self.program_type ||= shelter_building.program_type
  end
end
