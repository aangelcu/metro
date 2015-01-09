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
			return "Venta"
		elsif is_rent?
			return "Alquiler"
		end
	end

	def self.total_grouped_by_day(start)
		properties = where(created_at: start.beginning_of_day..Time.zone.now)
		properties = properties.group("date(created_at)")
		properties = properties.select("created_at, avg(m2_sale_value) as total_price ")
		properties.each_with_object({}) do |property, prices|
			prices[property.created_at.to_date] = property.total_price
		end
	end

end


