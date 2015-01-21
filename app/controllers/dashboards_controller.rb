class DashboardsController < ApplicationController
	before_action :authenticate_user!
	def index
		params[:from] = params[:from] || 3.months.ago
		params[:to] = params[:to] || 15.days.ago

		@properties = [ build_query(0) ]

		if params[:built_area_range].present? && params[:built_area_range][1].present?
			@properties << build_query(1)
		end

		if params[:built_area_range].present? && params[:built_area_range][2].present?
			@properties << build_query(2)
		end
  end

  def build_query(index)
  	properties = Property.joins(zone: :city)
		if params[:from].present?
			properties = properties.where("date >= ?", params[:from])
		end
		if params[:to].present?
			properties = properties.where("date <= ?", params[:to])
		end
		if params[:category].present?
			if params[:category] == "sale"
				properties = properties.where(m2_rent_value: nil)
			elsif params[:category] == "rent"
				properties = properties.where(m2_sale_value: nil)
			end
		end
		# if params[:built_area_range].present? && params[:built_area_range][index].present?
		# 	properties = properties.where(built_area: built_area_range(index))
		# end
		# if params[:stratus].present? && params[:stratus][index].present?
		# 	properties = properties.where(stratus: params[:stratus][index])
		# end
		if params[:property_type_id].present? && params[:property_type_id][index].present?
			properties = properties.where(property_type_id: params[:property_type_id] [index])
		end
		if params[:zone].present?
			properties = properties.where(zone: params[:zone])
		end
		if params[:state_id].present? && params[:state_id][index].present?
			properties = properties.where("cities.state_id = ?", params[:state_id][index])
		end

		return properties
  end

  def built_area_range(index)
		if params[:built_area_range][index] == '0'
			[0..100] 
		elsif params[:built_area_range][index] == '1'
			[101..200] 
		elsif params[:built_area_range][index] == '2'
			[201..300]
		end
	end

end