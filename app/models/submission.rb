class Submission < ApplicationRecord
  belongs_to :event
  belongs_to :proposal

  enum result: [ :accepted, :rejected ]
end
