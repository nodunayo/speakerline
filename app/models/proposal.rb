class Proposal < ApplicationRecord
  has_many :proposal_speakers
  has_many :speakers, through: :proposal_speakers
  has_many :submissions

  validates_presence_of :title
  validates_presence_of :body

  scope :search, -> (query) { where("title ILIKE ? OR body ILIKE ?", "%#{query}%", "%#{query}%") }

  acts_as_taggable
  validate :maximum_amount_of_tags

  def maximum_amount_of_tags
    number_of_tags = tag_list_cache_on("tags").uniq.length
    errors.add(:base, "must only have a maximum of 3 tags") if number_of_tags > 3
  end
end
