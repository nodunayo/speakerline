class CreateProposalSpeakers < ActiveRecord::Migration[7.2]
  def change
    create_table :proposal_speakers do |t|
      t.references :proposal, foreign_key: true
      t.references :speaker, foreign_key: true
      t.timestamps
    end
  end
end
