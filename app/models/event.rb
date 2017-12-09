class Event < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_insensitive: true }

  has_many :instances, foreign_key: :event_id,
                       class_name:  'EventInstance',
                       dependent:   :destroy
  has_many :submissions, through: :instances
end
