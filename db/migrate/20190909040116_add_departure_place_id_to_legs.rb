class AddDeparturePlaceIdToLegs < ActiveRecord::Migration[5.2]
  def change
    add_column :legs, :departure_place_id, :integer
  end
end
