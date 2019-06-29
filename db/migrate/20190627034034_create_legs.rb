class CreateLegs < ActiveRecord::Migration[5.2]
  def change
    create_table :legs do |t|
      t.string :arrival_place_id
      t.integer :departure_place_id
      t.integer :vacation_id

      t.timestamps
    end
  end
end
