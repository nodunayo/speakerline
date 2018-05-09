class EventInstance < ApplicationRecord
  # Virtual attribute for the parent event's name in case it is new
  attr_accessor :new_parent_event_name

  belongs_to :event
  has_many   :submissions

  default_scope { order :year }

  before_validation :set_parent_event

  validates :event, presence: true
  validates :year, uniqueness:   { scope: :event, message: 'should happen once per year' },
                   numericality: { only_integer: true }

  def name_and_year
    "#{event.name} #{year}"
  end

  private

  def set_parent_event
    if received_bad_event_params
      errors.add(:base, 'choose either an existing event or to create a new one')
    else
      event || build_event(name: new_parent_event_name)
    end
  end

  def received_bad_event_params
    received_both_new_and_existing_events || received_neither_new_nor_existing_events
  end

  def received_both_new_and_existing_events
    event && new_parent_event_name.present?
  end

  def received_neither_new_nor_existing_events
    event.nil? && new_parent_event_name.blank?
  end
end
