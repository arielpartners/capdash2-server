#
# street address: currently supports only New York City Boroughs
# Could be used for non NYC if borough is left null
#
# == Schema Information
#
# Table name: addresses
#
#  id         :integer          not null, primary key
#  line1      :string
#  line2      :string
#  city       :string
#  state      :string
#  zip        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  borough    :integer
#
class Address < ApplicationRecord
  has_one :shelter_building
  enum borough: { bronx: 1, brooklyn: 2, manhattan: 3, queens: 4,
                  staten_island: 5 }

  def to_s
    "#{[line1, line2].compact.join(' ')} #{city}, #{state} #{zip}"
  end
end
