#
# Adult Commercial Hotel. Annex. Assessment. Criminal Justice. Diversion.
# Employment. General. Mental Health. MICA. Special Population. Substance Abuse.
# or Young Adult
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
class ProgramType < Classifier
end
