class Submission < ApplicationRecord
  belongs_to :event_instance
  belongs_to :proposal

  validates_presence_of :event_instance
  validates_presence_of :proposal
  validates_presence_of :result, message: 'has not been chosen. Choose whether the proposal was accepted, rejected, or waitlisted'

  enum result: [ :accepted, :rejected, :waitlisted ]
end
