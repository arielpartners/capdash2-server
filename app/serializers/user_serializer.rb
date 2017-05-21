#
# Provide friendly JSON for a User for the front-end.  For example,
# we omit any sensitive fields
# @see User
#
class UserSerializer < ActiveModel::Serializer
  attributes :name, :email
end
