class CreateLegs < ActiveRecord::Migration[5.2]
  def change
    create_table :legs do |t|
      t.integer :vacation_id
      t.integer :destination_id
      t.integer :departure_id

      t.timestamps
    end
  end
end
