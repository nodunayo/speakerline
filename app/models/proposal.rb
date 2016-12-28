class Proposal < ApplicationRecord
  belongs_to :speaker
  has_many :submissions
end
