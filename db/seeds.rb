# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@sandiego = Destination.create(:city_name => "San Diego", :country_name => "United States")
@san_diego_1 = Attraction.create(:name => "Seaworld", :admission => "73.99", :webpage => "", :destination_id => "")
@san_diego_1 = Attraction.create(:name => "San Diego Zoo", :admission => "56", :webpage => "", :destination_id => "")

@seattle = Destination.create(:city_name => "Seattle", :country_name => "United States")
@seattle_1 = Attraction.create(:name => "Space Needle", :admission => "32", :webpage => "https://www.spaceneedle.com/", :destination_id => @seattle.id)
@seattle_2 = Attraction.create(:name => "Chihuly Museum", :admission => "32.50", :webpage => "https://www.chihulygardenandglass.com/", :destination_id => @seattle.id)

@banff = Destination.create(:city_name => "Banff", :country_name => "Canada")
@banff_1 = Attraction.create(:name => "Lake Louise", :admission => "Free", :webpage => "Lake Louise URL", :destination_id => @banff.id)

 @paris = Destination.create(:city_name => "Paris", :country_name => "France", )
 @paris_1 = Attraction.create(:name => "Eiffel Tower", :admission => "16.30", :webpage => "https://www.toureiffel.paris/en", :destination_id => @paris.id)
 @paris_2 = Attraction.create(:name => "Louvre", :admission => "15", :webpage => "https://www.louvre.fr/en", :destination_id => @paris.id)

 @tokyo = Destination.create(:city_name => "Tokyo", :country_name => "Japan", )
 @tokyo_1 = Attraction.create(:name => "Tokyo SkyTree", :admission => "28.54", :webpage => "http://www.tokyo-skytree.jp/en", :destination_id => @tokyo.id)
 @tokyo_2 = Attraction.create(:name => "Sensō-ji", :admission => "0.92", :webpage => "", :destination_id => @tokyo.id)

 @seoul = Destination.create(:city_name => "Seoul", :country_name => "Korea", )
 @seoul_1 = Attraction.create(:name => "Gyeongbokgung Palace", :admission => "2.55", :webpage => "", :destination_id => @seoul.id)
 @seoul_2 = Attraction.create(:name => "Myeondong Street", :admission => "0", :webpage => "", :destination_id => @seoul.id)

 #= Destination.create(:city_name => "", :country_name => "", )
 #= Attraction.create(:name => "", :admission => "", :webpage => "", :destination_id => "")
 #= Attraction.create(:name => "", :admission => "", :webpage => "", :destination_id => ""