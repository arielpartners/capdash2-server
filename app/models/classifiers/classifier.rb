#
# A Classifier is a tag or label used to group objects.
#
class Classifier < ApplicationRecord
  validates :name, presence: true
  belongs_to :parent, class_name: 'Classifier'
  has_many :children, class_name: 'Classifier', foreign_key: 'parent_id'
  before_save :ensure_slug

  def ensure_slug
    self.slug = name.parameterize
  end
end
