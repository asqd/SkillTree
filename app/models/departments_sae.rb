# == Schema Information
#
# Table name: departments_saes
#
#  id            :integer          not null, primary key
#  department_id :integer
#  sae_id        :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class DepartmentsSae < ApplicationRecord
  belongs_to :department
  belongs_to :sae
end
