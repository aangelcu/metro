module DashboardsHelper
	def properties_chart_data(start)
		properties_by_day = Property.total_grouped_by_day(start)
		(start.to_date..Date.today).map do |date|
			puts "#{properties_by_day[date]} == #{date}"
			{
				date: date,
   			m2_sale_value: properties_by_day[date] || 0
			}
		end	
	end
end
