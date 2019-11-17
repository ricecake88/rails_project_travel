class CreateAttractions < ActiveRecord::Migration[5.2]
  def change
    create_table :attractions do |t|
      t.integer :destination_id
      t.string :name
      t.string :admission
      t.string :webpage
      t.text :description

      t.timestamps
    end
  end
end
