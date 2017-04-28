class Identifier < ApplicationRecord
  validates :name, presence: true
end
