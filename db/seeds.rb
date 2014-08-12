# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

MapRoute.destroy_all
Map.destroy_all

map = Map.create!(name: "SP")
MapRoute.create!(from: "A", to: "B", distance: 10, map_id: map.id)
MapRoute.create!(from: "B", to: "D", distance: 15, map_id: map.id)
MapRoute.create!(from: "A", to: "C", distance: 20, map_id: map.id)
MapRoute.create!(from: "C", to: "D", distance: 30, map_id: map.id)
MapRoute.create!(from: "B", to: "E", distance: 50, map_id: map.id)
MapRoute.create!(from: "D", to: "E", distance: 30, map_id: map.id)
