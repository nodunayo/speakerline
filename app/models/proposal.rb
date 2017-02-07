class Proposal < ApplicationRecord
  belongs_to :speaker
  has_many :submissions

  validates_presence_of :title
  validates_presence_of :body
end
