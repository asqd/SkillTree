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
  has_many :specialties, -> { distinct }, through: :link_specialty_disciplines

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

  scope :with_links, -> { joins(:link_specialty_disciplines)
                          .select("disciplines.*,string_agg(DISTINCT link_specialty_disciplines.human_htype::varchar,',') as htypes,
                          string_agg(DISTINCT link_specialty_disciplines.human_short_htype::varchar,',') as short_htypes,
                          string_agg(DISTINCT link_specialty_disciplines.term_number::varchar,',') as terms")
                          .group(:id)
                        }

  scope :with_links_by_params, -> (params={}) { with_links.where_by_params(params) }

  def self.where_by_params(filters={})
    params = filters.symbolize_keys
    where_query = [].tap do |filter|
      filter << "link_specialty_disciplines.specialty_id = #{params[:specialty_id]}"
      filter << "link_specialty_disciplines.term_number = #{params[:term_number]}" if params[:term_number].present?
    end

    where(where_query.join(" AND "))
  end

  ### methods and helpers
  def human_label
    case
    when label.include?("-ГМ")
      "Гуманитарный"
    when label.include?("-ОНМ")
      "Общенаучный"
    when label.include?("-ОПМ")
      "Общепрофессиональный"
    when label.include?("-ПМ")
      "Профессиональный"
    when label.include?("-ЕНМ")
      "Естественнонаучный"
    when label.include?("-ИПМ")
      "Информационно-правовой"
    else
      label
    end
  end

  def sorted_short_htype
    order = ['Лек', 'Лаб', 'Пр', 'СРС', 'КСР', 'К/п', 'К/р', 'Зач', 'Экз']
    ApplicationController.helpers.custom_sort(short_htypes.split(','), order)
  end
end
