module DashboardsHelper
	def properties_chart_data(start, end_date)
		properties_by_day = {}
		(start.to_date..end_date).map do |date|
			# puts "#{properties_by_day[date]} == #{date}"
			p = {
				date: date,
   			# m2_sale_value_1: properties_by_day[date] || 0,
   			# m2_sale_value_2: properties_by_day[date] || 0,
   			# m2_sale_value_3: properties_by_day[date] || 0,
			};

			@properties.each_with_index do |props, index|
				value = props.total_grouped_by_day(start)[date]
				p["m2_sale_value_#{index}"] = value.to_i if value
			end

			p
		end	
	end
end
