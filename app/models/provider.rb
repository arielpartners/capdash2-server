#
# An organization that operates one or more shelters within one of the five NYC
# boroughs.
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
