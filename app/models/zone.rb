# == Schema Information
#
# Table name: zones
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  city_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Zone < ActiveRecord::Base
  has_many :properties
  belongs_to :city
end
