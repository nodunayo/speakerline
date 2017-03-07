class Event < ApplicationRecord
  validates_presence_of :name
  validates :year, presence: true, numericality: {only_integer: true}
  validates_uniqueness_of :name, scope: :year

  def name_and_year
    "#{name} #{year}"
  end
end
