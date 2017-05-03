# == Schema Information
#
# Table name: disciplines
#
#  id            :integer          not null, primary key
#  name          :string
#  label         :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  zet           :float
#  practice?     :boolean
#  department_id :integer
#  human_label   :string
#

class Discipline < ApplicationRecord
  has_many :link_specialty_disciplines
  has_many :specialties, -> { distinct }, through: :link_specialty_disciplines
  belongs_to :department

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

  scope :with_links, -> {
    joins(:link_specialty_disciplines)
    .select("
      disciplines.*,string_agg(DISTINCT link_specialty_disciplines.human_htype::varchar,',') as htypes,
      string_agg(DISTINCT link_specialty_disciplines.human_short_htype::varchar,',') as short_htypes,
      string_agg(DISTINCT link_specialty_disciplines.term_number::varchar,',') as terms,
      json_object(array_agg(link_specialty_disciplines.human_short_htype::text), array_agg(link_specialty_disciplines.hours::text)) as hours
    ")
    .group(:id)
  }

  scope :compare, -> (specialty_ids, term_number) {
    joins(:link_specialty_disciplines)
    .select("
      DISTINCT ON (disciplines.id) disciplines.*,
      string_agg(DISTINCT link_specialty_disciplines.human_htype::varchar,',') as htypes,
      string_agg(DISTINCT link_specialty_disciplines.human_short_htype::varchar,',') as short_htypes,
      (SELECT
        json_object(array_agg(ls.human_short_htype::text), array_agg(ls.hours::text))
        FROM link_specialty_disciplines as ls
        WHERE ls.specialty_id = #{specialty_ids[0]}
        AND ls.discipline_id=disciplines.id
        AND ls.term_number=#{term_number})
      as first,
      (SELECT
        json_object(array_agg(ls.human_short_htype::text), array_agg(ls.hours::text))
        FROM link_specialty_disciplines as ls
        WHERE ls.specialty_id= #{specialty_ids[1]}
        AND ls.discipline_id = disciplines.id
        AND ls.term_number=#{term_number})
      as second
    ")
    .select("link_specialty_disciplines.specialty_id, link_specialty_disciplines.discipline_id")
    .group(
      "link_specialty_disciplines.specialty_id,
      link_specialty_disciplines.discipline_id"
    )
    .where(link_specialty_disciplines: { specialty_id: specialty_ids, term_number: term_number })
    .group(:id)
  }

  scope :with_links_by_params, -> (params={}) { with_links.where_by_params(params) }

  scope :with_links_id, -> {
    with_links
    .select("link_specialty_disciplines.specialty_id, link_specialty_disciplines.discipline_id")
    .group("
    link_specialty_disciplines.specialty_id,
    link_specialty_disciplines.discipline_id"
    )
  }

  def self.where_by_params(filters={})
    params = filters.symbolize_keys
    where_query = [].tap do |filter|
      filter << "link_specialty_disciplines.specialty_id = #{params[:specialty_id]}"
      filter << "link_specialty_disciplines.term_number = #{params[:term_number]}" if params[:term_number].present?
    end

    where(where_query.join(" AND "))
  end

  ### methods and helpers
  # def human_label
  #   case
  #   when label.include?("-ГМ")
  #     "Гуманитарный"
  #   when label.include?("-ОНМ")
  #     "Общенаучный"
  #   when label.include?("-ОПМ")
  #     "Общепрофессиональный"
  #   when label.include?("-ПМ")
  #     "Профессиональный"
  #   when label.include?("-ЕНМ")
  #     "Естественнонаучный"
  #   when label.include?("-ИПМ")
  #     "Информационно-правовой"
  #   else
  #     "Другое"
  #   end
  # end

  def sorted_short_htype
    order = ['Лек', 'Лаб', 'Пр', 'СРС', 'КСР', 'К/п', 'К/р', 'Зач', 'Экз']
    ApplicationController.helpers.custom_sort(short_htypes.split(','), order)
  end
end
