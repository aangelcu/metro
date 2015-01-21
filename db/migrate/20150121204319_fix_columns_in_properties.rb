class FixColumnsInProperties < ActiveRecord::Migration
  def change
  	change_column :properties, :m2_sale_value, :integer
  	change_column :properties, :m2_rent_value, :integer
  end
end
