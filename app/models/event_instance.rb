class EventInstance < ApplicationRecord
  # Virtual attribute for the parent event's name in case it is new
  attr_accessor :new_parent_event_name

  belongs_to :event
  has_many   :submissions

  default_scope { order :year }

  before_validation :set_parent_event

  validates :year, presence: true,
                   uniqueness:   { scope: :event, message: 'should happen once per year' },
                   numericality: { only_integer: true, message: 'has to be a number' }

  def name_and_year
    "#{event.name} #{year}"
  end

  # Sorts by result (accepted, waitlisted, rejected), then by proposal title.
  # Consider moving to a scope if we want this order in more places.
  def sorted_submissions
    submissions.joins(:proposal)
               .in_order_of(:result, [:accepted, :waitlisted, :rejected])
               .order('proposals.title')
  end

  private

  def set_parent_event
    if received_bad_event_params
      errors.add(:base, 'Choose either an existing event or create a new one')
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
