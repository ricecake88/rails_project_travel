class CreateDestinations < ActiveRecord::Migration[5.2]
  def change
    create_table :destinations do |t|
      t.string :country_name
      t.string :country_code
      t.string :state_name
      t.string :state_code
      t.string :city_name

      t.timestamps
    end
  end
end
