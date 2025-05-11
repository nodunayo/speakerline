class Speaker < ApplicationRecord
  has_many :proposal_speakers
  has_many :proposals, through: :proposal_speakers

  validates_presence_of :name
  validates_uniqueness_of :name
end
