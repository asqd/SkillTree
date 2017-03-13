# == Schema Information
#
# Table name: disciplines
#
#  id         :integer          not null, primary key
#  name       :string
#  label      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  zet        :float
#  practice   :boolean
#

class Discipline < ApplicationRecord
  has_many :link_specialty_disciplines
  has_many :specialties, -> { uniq }, through: :link_specialty_disciplines

  ### Scopes
  # module scopes
  scope :main, -> { where("label ILIKE '%1-%'") }
  scope :practice, -> { where("label ILIKE '%2-%'") }
  scope :others, -> { where("label ILIKE '%3-%'") }


  # profile scopes
  scope :humanitarian, -> { where("label ILIKE '%-ГМ%'") }
  scope :general_sciencific, -> { where("label ILIKE '%-ОНМ%'") }
  scope :general_professional, -> { where("label ILIKE '%-ОПМ%'") }
  scope :professional, -> { where("label ILIKE '%-ПМ.%'") }
  scope :naturally_sciencific, -> { where("label ILIKE '%-ЕНМ%'") }
  scope :inf_legal, -> { where("label ILIKE '%-ИПМ%'") }

  # type scopes
  scope :basic, -> { where("label ILIKE '%.Б.%'") }
  scope :variable, -> { where("label ILIKE '%.В.%'") }
  scope :variable_obligatory, -> { where("label ILIKE '%.В.ОД%'") }
  scope :variable_elective, -> { where("label ILIKE '%.В.ДВ%'") }

end
