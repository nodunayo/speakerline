class ProposalSpeaker < ApplicationRecord
  belongs_to :proposal
  belongs_to :speaker
end
