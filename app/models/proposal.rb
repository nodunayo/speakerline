class Proposal < ApplicationRecord
  belongs_to :speaker
  has_many :submissions

  validates_presence_of :title
  validates_presence_of :body


  acts_as_taggable
  validate :maximum_amount_of_tags

  def maximum_amount_of_tags
    number_of_tags = tag_list_cache_on("tags").uniq.length
    errors.add(:base, "must only have a maximum of 3 tags") if number_of_tags > 3
  end
end
