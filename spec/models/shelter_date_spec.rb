require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe ShelterDate, type: :model do
  context 'before a given cutoff hour' do
    it 'shelter date will equal the previous calendar date' do
      shelter_date = ShelterDate.new('3rd Feb 2017 02:05:06 AM', 3)
      expect(shelter_date.date).to eq(Date.parse('2nd Feb 2017'))
    end
  end
  context 'after a given cutoff hour' do
    it 'shelter date will equal the current calendar date' do
      shelter_date = ShelterDate.new('3rd Feb 2017 06:05:06 AM', 3)
      expect(shelter_date.date).to eq(Date.parse('3nd Feb 2017'))
    end
  end
  context 'at a time before cutoff hour' do
    it 'shelter date will be equal to the previous calendar date' do
      day_one_after_cutoff = ShelterDate.new('2nd Feb 2017 11:15:06 AM', 3)
      day_two_before_cutoff = ShelterDate.new('3rd Feb 2017 02:05:06 AM', 3)
      expect(day_two_before_cutoff).to eq(day_one_after_cutoff)
    end
  end
  it 'can be compared' do
    feb3 = ShelterDate.new('3rd Feb 2017 06:05:06 AM', 3)
    feb7 = ShelterDate.new('7rd Feb 2017 06:05:06 AM', 3)
    expect(feb3).to be < feb7
    expect(feb7).to be > feb3
    expect(feb3).to eq(feb3)
  end
  it 'will sort based on shelter date, not real datetime' do
    a = ShelterDate.new('3rd Feb 2017 02:00:00 AM', 3)
    b = ShelterDate.new('2nd Feb 2017 07:05:06 PM', 3)
    c = ShelterDate.new('15th Feb 2017 011:20:00 AM', 3)
    d = ShelterDate.new('7th Feb 2017 05:10:00 PM', 3)
    sorted = [a, b, c, d].sort
    expect(sorted.first).to eq(a)
    expect(sorted.last).to eq(c)
  end
  it 'can be printed as a string' do
    shelter_date = ShelterDate.new('3rd Feb 2017 02:05:06 AM', 3)
    expect(shelter_date.to_s).to eq('2017-02-02')
  end
end
