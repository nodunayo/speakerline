class ChangeYearToInteger < ActiveRecord::Migration[5.0]


  def up
  	events = Event.pluck(:id, :year)
  	remove_column :events, :year
  	add_column :events, :year, :integer, null: false

  	events.each do |event|
  		id = event[0]
  		year = event[1].to_i
  		Event.find(id).update_attributes!(year: year)
  	end
  end

  def down
  	events = Event.pluck(:id, :year)
  	remove_column :events, :year
  	add_column :event, :year, :string, null: false

  	events.each do |event|
  		id = event[0]
  		year = event[1].to_s
  		Event.find(id).update_attributes!(year: year)
  	end
  end
end
