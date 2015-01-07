class DashboardsController < ApplicationController

	def index
		@properties = Property.joins(zone: :city)
		if params[:from].present?
			@properties = @properties.where("date >= ?", params[:from])
		end
		if params[:to].present?
			@properties = @properties.where("date <= ?", params[:to])
		end
		if params[:category].present?
			if params[:category] == "sale"
				@properties = @properties.where(m2_rent_value: nil)
			elsif params[:category] == "rent"
				@properties = @properties.where(m2_sale_value: nil)
			end
		end
		if params[:stratus].present?
			@properties = @properties.where(stratus: params[:stratus])
		end
		if params[:property_type].present?
			@properties = @properties.where(property_type: params[:property_type])
		end
		if params[:zone].present?
			@properties = @properties.where(zone: params[:zone])
		end
		if params[:state_id].present?
			@properties = @properties.where("cities.state_id = ?", params[:state_id])
		end
  end

end

# Hacer el if del category diciendo q si me trae 0, entonces q me muestre "0 a 100 M2"
