class Event < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :year
  validates_numericality_of :year, {only_integer: true}
  validates_uniqueness_of :name, scope: :year

  def name_and_year
    "#{name} #{year}"
  end
end
