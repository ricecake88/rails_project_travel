class ChangeDataTypeForAdmission < ActiveRecord::Migration[5.2]
  def change
    change_column :attractions, :admission, 'integer USING CAST(column_name AS integer)'
  end
end
