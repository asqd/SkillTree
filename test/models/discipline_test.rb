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

require 'test_helper'

class DisciplineTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
