# Model for user of capdash system
class User < ApplicationRecord
  has_secure_password
end
