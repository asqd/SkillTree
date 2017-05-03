# == Schema Information
#
# Table name: saes
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Sae < ApplicationRecord
  has_many :departments_saes
  has_many :departments, through: :departments_saes
  # has_many :specialties, -> { joins("INNER JOIN departments_saes ON specialties.department_id = departments_saes.department_id INNER JOIN saes ON saes.id = departments_saes.sae_id") }, foreign_key: "department_id"

  def specialties
    Specialty.joins("INNER JOIN departments_saes ON specialties.department_id = departments_saes.department_id AND departments_saes.sae_id = #{id}")
  end

  def disciplines
    Discipline.joins("INNER JOIN departments_saes ON disciplines.department_id = departments_saes.department_id AND departments_saes.sae_id = #{id}")
  end
end
