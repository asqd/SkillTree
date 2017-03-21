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
  has_many :disciplines, -> { distinct }, through: :link_specialty_disciplines

  ### Scopes
  scope :directions, -> { group(:direction, :human_level, :code).select("direction, human_level, code") }

  scope :with_term_number, -> { joins(:link_specialty_disciplines).select("specialties.*, count(distinct link_specialty_disciplines.term_number) as terms_count").group(:id) }
end
