class AddQuantityToVacationPlace < ActiveRecord::Migration[5.2]
  def change
    add_column :vacation_places, :quantity, :integer
  end
end
