#
# Either Single Adult, Adult Family, Family with Children
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
class CaseType < Classifier
end
