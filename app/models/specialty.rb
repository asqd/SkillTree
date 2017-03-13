# == Schema Information
#
# Table name: specialties
#
#  id               :integer          not null, primary key
#  dtype            :integer
#  human_dtype      :string
#  direction        :string
#  level            :integer
#  human_level      :string
#  study_form       :integer
#  human_study_form :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  full_direction   :string
#  code             :string
#  profile          :string
#  qualification    :string
#

class Specialty < ApplicationRecord
  has_many :link_specialty_disciplines
  has_many :disciplines, -> { uniq }, through: :link_specialty_disciplines
end
