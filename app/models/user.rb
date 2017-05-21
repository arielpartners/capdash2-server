#
# Model for user of capdash system
# @see schema.rb
#
class User < ApplicationRecord
  has_secure_password
end
