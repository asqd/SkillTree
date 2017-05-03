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
#  department_id    :integer
#

class Specialty < ApplicationRecord
  has_many :link_specialty_disciplines
  has_many :disciplines, -> { distinct }, through: :link_specialty_disciplines
  belongs_to :department

  ### Scopes
  scope :directions, -> { group(:direction, :human_level, :code).select("direction, human_level, code") }

  scope :with_term_number, -> { joins(:link_specialty_disciplines).select("specialties.*, count(distinct link_specialty_disciplines.term_number) as terms_count").group(:id) }

  def saes
    if department_id
      Sae.joins("INNER JOIN departments_saes ON departments_saes.sae_id = saes.id").where("departments_saes.department_id = #{department_id}")
    else
      []
    end
  end

  def sae_string
    if saes.pluck(:name).present?
      saes.pluck(:name).join('; ')
    else
      " - "
    end
  end
end
