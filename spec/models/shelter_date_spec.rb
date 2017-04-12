require 'rails_helper'

RSpec.describe ShelterDate, type: :model do
  context 'before 3am' do
    it 'uses previous calendar date' do
      datetime = DateTime.parse('3rd Feb 2017 02:05:06 AM')
      shelter_date = ShelterDate.new(datetime)
      expect(shelter_date.date).to eq(Date.parse('2nd Feb 2017'))
    end
  end
  context 'after 3am' do
    it 'uses current calendar date' do
      datetime = DateTime.parse('3rd Feb 2017 06:05:06 AM')
      shelter_date = ShelterDate.new(datetime)
      expect(shelter_date.date).to eq(Date.parse('3nd Feb 2017'))
    end
  end
end
