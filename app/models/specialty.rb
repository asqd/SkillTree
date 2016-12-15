class Specialty < ApplicationRecord
  has_many :link_specialty_disciplines

  def self.name_search(search)
    where("full_direction ilike ?", "%#{search}%")
  end

  def self.level_search(search)
    where("level = ?", "#{search}")
  end

  def self.form_search(search)
    where("study_form = ?", "#{search}")
  end

end
