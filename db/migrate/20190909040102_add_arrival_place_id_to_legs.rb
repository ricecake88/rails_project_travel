class AddArrivalPlaceIdToLegs < ActiveRecord::Migration[5.2]
  def change
    add_column :legs, :arrival_place_id, :integer
  end
end
