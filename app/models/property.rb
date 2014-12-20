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

class Property < ActiveRecord::Base
	belongs_to :zone
	belongs_to :property_type
end
