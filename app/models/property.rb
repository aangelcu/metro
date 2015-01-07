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
	def is_sale?
		m2_sale_value != nil
	end
	def is_rent?
		m2_rent_value != nil
	end
	def category
		if is_sale?
			return "sale"
		elsif is_rent?
			return "rent"
		end
	end
end
