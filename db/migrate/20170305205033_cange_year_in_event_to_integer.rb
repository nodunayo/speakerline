class CangeYearInEventToInteger < ActiveRecord::Migration[5.0]
  def up
  	remove_column :events, :year, :string
  	add_column :events, :year, :integer
  end

  def down
  	remove_column :events, :year, :integer
  	add_column :events, :year, :string
  end
end
