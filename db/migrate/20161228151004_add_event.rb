class AddEvent < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :name, null: false
      t.string :year, null: false

      t.timestamps
    end
  end
end
