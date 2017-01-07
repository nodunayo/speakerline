class Speaker < ApplicationRecord
  has_many :proposals

  validates_presence_of :name
  validates_uniqueness_of :name
end
