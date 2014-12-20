# == Schema Information
#
# Table name: properties
#
#  id               :integer          not null, primary key
#  property_type_id :integer
#  zone_id          :integer
#  date             :date
#  stratus          :integer
#  built_area       :integer
#  m2_sale_value    :decimal(, )
#  m2_rent_value    :decimal(, )
#  created_at       :datetime
#  updated_at       :datetime
#

require 'test_helper'

class PropertyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
