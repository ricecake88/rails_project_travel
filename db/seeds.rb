# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@sandiego = Place.create(:city_name => "San Diego", :country_name => "United States")
@seattle = Place.create(:city_name => "Seattle", :country_name => "United States")
@seattle_1 = Attraction.create(:name => "Space Needle", :admission => "$10", :webpage => "Space Needle URL", :place_id => @seattle.id)
@seattle_2 = Attraction.create(:name => "Chihuly Museum", :admission => "$24", :webpage => "Chihuly Museum URL", :place_id => @seattle.id)

@banff = Place.create(:city_name => "Banff", :country_name => "Canada")
@banff_1 = Attraction.create(:name => "Lake Louise", :admission => "Free", :webpage => "Lake Louise URL", :place_id => @banff.id)
