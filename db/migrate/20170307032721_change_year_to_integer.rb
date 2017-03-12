class ChangeYearToInteger < ActiveRecord::Migration[5.0]


  def up

  	add_column :events, :year_integer, :integer
    execute <<-SQL
      UPDATE events
      SET year_integer = CAST(year as integer);
    SQL
  	remove_column :events, :year
    rename_column :events, :year_integer, :year
    change_column :events, :year, :integer, null: false
  end

  def down
  	add_column :events, :year_string, :string
    execute <<-SQL
      UPDATE events
      SET year_string = CAST(year as varchar);
    SQL
    remove_column :events, :year
    rename_column :events, :year_string, :year
    change_column :events, :year, :string, null: false
  end
end
