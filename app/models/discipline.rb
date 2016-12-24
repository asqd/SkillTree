# == Schema Information
#
# Table name: disciplines
#
#  id         :integer          not null, primary key
#  name       :string
#  label      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Discipline < ApplicationRecord
  has_many :link_specialty_disciplines
  has_many :specialties, through: :link_specialty_disciplines
end
