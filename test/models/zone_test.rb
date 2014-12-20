# == Schema Information
#
# Table name: zones
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  city_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class ZoneTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
