class ChangeYearToInteger < ActiveRecord::Migration[5.0]
  def up
    change_column :events, :year, 'integer USING CAST(year AS integer)', null: false
  end

  def down
    change_column :events, :year, :string, null: false
  end
end
