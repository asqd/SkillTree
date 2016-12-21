# == Schema Information
#
# Table name: link_specialty_disciplines
#
#  id            :integer          not null, primary key
#  term          :integer
#  htype         :integer
#  human_htype   :string
#  specialty_id  :integer
#  discipline_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'test_helper'

class LinkSpecialtyDisciplineTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
