class AddRquiredToYearInEvents < ActiveRecord::Migration[5.0]
  def change
  	change_column :events, :year, :integer, null: false
  end
end
