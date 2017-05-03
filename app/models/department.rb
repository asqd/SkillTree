# == Schema Information
#
# Table name: departments
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Department < ApplicationRecord
  has_many :departments_saes
  has_many :saes, through: :departments_saes
  has_many :disciplines
  has_many :specialties
end
