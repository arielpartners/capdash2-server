#
# A Classifier is a tag or label used to group objects.
#
class Classifier < ApplicationRecord
  validates :name, presence: true
  belongs_to :parent, class_name: 'Classifier'
end
