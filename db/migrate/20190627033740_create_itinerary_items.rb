class CreateItineraryItems < ActiveRecord::Migration[5.2]
  def change
    create_table :itinerary_items do |t|
      t.integer :leg_id
      #t.integer :vacation_id
      t.integer :day_of_trip

      t.datetime :time      
      t.string :type_of_activity
      t.integer :attraction_id

      t.string :mode_of_transport
      t.datetime :transport_departure_time
      t.datetime :transport_arrival_time
      
      t.text :notes
      t.integer :activity_order


      t.timestamps
    end
  end
end
