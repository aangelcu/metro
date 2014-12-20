# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  password   :string(255)
#  company_id :integer
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
	belongs_to :company
end
