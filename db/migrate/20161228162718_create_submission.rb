class CreateSubmission < ActiveRecord::Migration[5.0]
  def change
    create_table :submissions do |t|
      t.integer :result
      t.references :proposal, foreign_key: true
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
