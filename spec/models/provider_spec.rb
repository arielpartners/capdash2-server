require 'rails_helper'

RSpec.describe Provider, type: :model do
  it 'has a name' do
    provider1 = Provider.new
    provider2 = Provider.new(name: 'Example Provider')
    expect(provider1).to_not be_valid
    expect(provider2).to be_valid
  end
end
