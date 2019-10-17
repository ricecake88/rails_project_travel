class AddLegNumToLegs < ActiveRecord::Migration[5.2]
  def change
    add_column :legs, :leg_num, :integer
  end
end
