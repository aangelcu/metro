# == Schema Information
#
# Table name: property_types
#
#  id         :integer          not null, primary key
#  type       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class PropertyType < ActiveRecord::Base
	self.inheritance_column = nil
	has_many :properties
end
