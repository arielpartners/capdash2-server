require 'rails_helper'

RSpec.describe ShelterDate, type: :model do
  context 'before a given hour' do
    it '#datecutoff will return the previous date' do
      shelter_date = ShelterDate.new('3rd Feb 2017 02:05:06 AM', 3)
      expect(shelter_date.date).to eq(Date.parse('2nd Feb 2017'))
    end
  end
  context 'after a given hour' do
    it '#datecutoff will return ' do
      shelter_date = ShelterDate.new('3rd Feb 2017 06:05:06 AM', 3)
      expect(shelter_date.date).to eq(Date.parse('3nd Feb 2017'))
    end
  end
  it 'can be sorted' do
    feb3 = ShelterDate.new('3rd Feb 2017 06:05:06 AM', 3)
    feb7 = ShelterDate.new('7rd Feb 2017 06:05:06 AM', 3)
    expect(feb3).to be < feb7
    expect(feb7).to be > feb3
    expect(feb3).to eq(feb3)
  end
end
