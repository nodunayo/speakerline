class AddSpeakerIdToProposal < ActiveRecord::Migration[5.0]
  def change
    change_table :proposals do |t|
      t.references :speaker, foreign_key: true
    end
  end
end
