class Event < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :year
  validates_uniqueness_of :name, scope: :year

  def name_and_year
    "#{name} #{year}"
  end
end
