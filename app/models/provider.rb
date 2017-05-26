#
# An organization that operates one or more shelters within one of the five NYC
# boroughs.
#
# == Schema Information
#
# Table name: providers
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  slug       :string
#
class Provider < ApplicationRecord
  has_many :shelters

  validates :name, presence: true
  before_save :create_slug

  private

  def create_slug
    self.slug = name.parameterize
  end
end
