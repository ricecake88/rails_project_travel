class CreateVacationPlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :vacation_places do |t|
      t.integer :vacation_id
      t.integer :place_id

      t.timestamps
    end
  end
end
