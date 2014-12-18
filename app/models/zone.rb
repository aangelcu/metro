class Zone < ActiveRecord::Base
  has_many :properties
  belongs_to :city
end
