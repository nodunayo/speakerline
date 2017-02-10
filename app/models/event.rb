class Event < ApplicationRecord
  def name_and_year
    "#{name} #{year}"
  end
end
