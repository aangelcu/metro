# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)




a = State.create(name: "Antioquia")
c = State.create(name: "Cundinamarca")
v = State.create(name: "Valle")

m = City.create(name: "Medellin", state: a)
b = City.create(name: "Bogota", state: c)
l = City.create(name: "Cali", state: v)

zones = [
	Zone.create(name: "Itagui", city: m),
	Zone.create(name: "Cedritos", city: b),
	Zone.create(name: "Juanchito", city: l)
]

property_types = [
	PropertyType.create(type: "Oficinas"),
	PropertyType.create(type: "Bodegas"),
	PropertyType.create(type: "Apartamentos")
]

(3.months.ago.to_date..Date.current).each do |day|
	num = Random.rand(100...200)
	num.times do |p|
		Property.create(date: day, zone: zones.sample, property_type: property_types.sample, stratus: Random.rand(1...6), m2_sale_value: Random.rand(500000...10000000), built_area: Random.rand(20...5000))
	end
end
