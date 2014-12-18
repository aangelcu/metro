class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.integer :property_type_id
      t.integer :zone_id
      t.date :date
      t.integer :stratus
      t.integer :built_area
      t.decimal :m2_sale_value
      t.decimal :m2_rent_value

      t.timestamps
    end
  end
end
