require 'rails_helper'

RSpec.describe AvatarUploader do
  before(:each) { @user = User.new(id: 99) }
  it 'stores files where expected' do
    expected_file_path = 'uploads/user/avatar/99'
    expect(@user.avatar.store_dir).to eq(expected_file_path)
  end
  it 'whitelists appropriate file extensions' do
    allowed_extensions = %w(jpg jpeg gif png)
    expect(@user.avatar.extension_whitelist).to match_array(allowed_extensions)
  end
end
