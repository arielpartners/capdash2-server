#
# A floor belonging to a shelter building
# Note that a physical floor may have more than one Floor records,
# for example, one per ProgramType or per CaseType
# @see CaseType
# @see ProgramType
# @see schema.rb
#
class Floor < ApplicationRecord
  has_many :places, as: :compartment
  belongs_to :shelter_building
  belongs_to :case_type
  belongs_to :program_type

  def case_type
    super || shelter_building.case_type
  end

  def program_type
    super || shelter_building.program_type
  end
end
