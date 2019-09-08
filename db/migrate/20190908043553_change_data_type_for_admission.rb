class ChangeDataTypeForAdmission < ActiveRecord::Migration[5.2]
  def change
    change_column(:attractions, :admission, :integer)
  end
end
