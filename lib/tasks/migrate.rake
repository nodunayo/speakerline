namespace :migrate do
  desc "Migrate proposals from belongs_to :speaker to has_many :speakers"
  task speakers: :environment do
    Proposal.all.each do |proposal|
      speaker = Speaker.find_by(id: proposal.speaker_id)
      next if speaker.blank?
      ProposalSpeaker.create(proposal:, speaker:)
    end
  end
end