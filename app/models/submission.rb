class Submission < ApplicationRecord
  belongs_to :event
  belongs_to :proposal

  validates_presence_of :event
  validates_presence_of :proposal
  validates_presence_of :result

  enum result: [ :accepted, :rejected, :waitlisted ]
end
