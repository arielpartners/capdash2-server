json.extract! @user, :name, :email
json.profile_image @user.avatar.thumb.url
