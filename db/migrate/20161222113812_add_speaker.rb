class AddSpeaker < ActiveRecord::Migration[5.0]
  def change
    create_table :speakers do |t|
      t.string :name
      t.timestamps
    end
  end
end
