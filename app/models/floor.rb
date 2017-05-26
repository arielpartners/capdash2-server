#
# A floor belonging to a shelter building
# Note that a physical floor may have more than one Floor records,
# for example, one per ProgramType or per CaseType
#
# == Schema Information
#
# Table name: floors
#
#  id                  :integer          not null, primary key
#  name                :string
#  shelter_building_id :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  case_type_slug      :string
#  program_type_slug   :string
#
class Floor < ApplicationRecord
  has_many :places, as: :compartment
  belongs_to :shelter_building
  belongs_to :case_type, foreign_key: :case_type_slug, primary_key: :slug
  belongs_to :program_type, foreign_key: :program_type_slug, primary_key: :slug

  def case_type
    super || shelter_building.case_type
  end

  def program_type
    super || shelter_building.program_type
  end
end
