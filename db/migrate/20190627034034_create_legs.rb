class CreateLegs < ActiveRecord::Migration[5.2]
  def change
    create_table :legs do |t|
      t.string :arrival_country_name
      t.string :arrival_country_code
      t.string :arrival_state_name
      t.string :arrival_state_code
      t.string :arrival_city_name
      t.integer :vacation_id

      t.string :departure_country_name
      t.string :departure_country_code
      t.string :departure_state_name
      t.string :departure_state_code

      t.string :departure_city_name

      t.timestamps
    end
  end
end
