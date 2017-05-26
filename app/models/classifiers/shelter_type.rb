#
# Either adult shelter, late arrival, family hotel, family cluster, adult
# family hotel, adult famile tier 2, or family tier 2
#
# == Schema Information
#
# Table name: classifiers
#
#  id          :integer          not null, primary key
#  name        :string
#  type        :string
#  code        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  parent_id   :integer
#  description :text
#  slug        :string
#
class ShelterType < Classifier
end
