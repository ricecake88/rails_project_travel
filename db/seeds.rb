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


@user1 = User.create!(:first_name => "FirstName", :last_name => "LastName", :place_id => @sandiego.id, :email => "test@gmail.com", :password => "password", :password_confirmation => "password")
@user1_vacation1 = Vacation.create(:user_id => 1, :name => "North America!")
@user1_vacation1_leg1 = Leg.create(:vacation_id => @user1_vacation1.id, :arrival_city_name => @seattle.id, :departure_city_name => @sandiego.id)
@user1_vacation1_leg2 = Leg.create(:vacation_id => @user1_vacation1.id, :arrival_city_name => @banff.id, :departure_city_name => @seattle.id)
@user1_vacation2 = Vacation.create(:user_id => 1, :name => "Seattle With Family")
@user1_vacation2_leg1 = Leg.create(:vacation_id => @user1_vacation2.id, :arrival_city_name => @seattle.id, :departure_city_name => @sandiego.id)

@user_v1_l1_item1 = ItineraryItem.create(:leg_id => @user1_vacation1_leg1.id, :vacation_id => @user1_vacation1.id, :day_of_trip => 1,
    :type_of_activity => "Activity", :attraction_id => @seattle_1.id, :activity_order => 1)
@user_v1_l1_item2 = ItineraryItem.create(:leg_id => @user1_vacation1_leg1.id, :vacation_id => @user1_vacation1.id, :day_of_trip => 2,
    :type_of_activity => "Activity", :attraction_id => @seattle_2.id, :activity_order => 1)
@user_v1_l2_item1 = ItineraryItem.create(:leg_id => @user1_vacation1_leg2.id, :vacation_id => @user1_vacation1.id, :day_of_trip => 3,
    :type_of_activity => "Activity", :attraction_id => @banff_1.id, :activity_order => 1)

@user_v2_l1_item1 = ItineraryItem.create(:leg_id => @user1_vacation2_leg1.id, :vacation_id => @user1_vacation2.id, :day_of_trip => 1,
    :type_of_activity => "Transport", :mode_of_transport => "Airplane", :activity_order=> 1)

