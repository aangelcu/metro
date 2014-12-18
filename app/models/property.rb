class Property < ActiveRecord::Base
	belongs_to :zone
	belongs_to :property_type
end
