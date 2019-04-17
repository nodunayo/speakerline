require 'rails_helper'

RSpec.describe EventInstance do
  subject { create(:event_instance) }

  around(:each, disable_parent_event_setter: true) do |ex|
    EventInstance.skip_callback(:validation, :before, :set_parent_event)
    ex.run
    EventInstance.set_callback(:validation, :before, :set_parent_event)
  end

  # The :set_parent_event callback interferes with shoulda's validation test
  # Manually test validation of event field.
  it 'should validate presence of event_id', disable_parent_event_setter: true do
    instance = EventInstance.new(event_id: nil, year: '2017')
    expect(instance).not_to be_valid
  end

  # Numericality implicitly tests presence; by default it will reject nil
  it { should validate_numericality_of(:year).only_integer.with_message("has to be a number") }

  it 'should validate uniqueness of year scoped to the parent event' do
    event = create(:event)
    create(:event_instance, event: event, year: '2017')
    invalid_instance = EventInstance.new(event_id: event.id, year: '2017')
    expect(invalid_instance).not_to be_valid
  end

  describe '#name_and_year' do
    it 'returns the name and the year of the cohort as a string' do
      event = create(:event)
      event_instance = EventInstance.new(event: event, year: '2021')
      expect(event_instance.name_and_year).to eq("#{event.name} 2021")
    end
  end

  describe '#set_parent_event' do
    context 'given an existing event id' do
      it 'does not change the event id' do
        event = create(:event)
        instance = EventInstance.create(event_id: event.id, year: '2020')
        expect(instance.reload.event).to eq(event)
      end
    end

    context 'given a new event name string' do
      it 'creates a new event and sets its id as event_id' do
        instance = EventInstance.new(event_id:              nil,
                                     new_parent_event_name: 'Tha Bomb Conf',
                                     year:                  '2020')
        expect { instance.save }.to change { Event.count }
        expect(instance.reload.event.name).to eq('Tha Bomb Conf')
      end
    end

    context 'given neither event id or name' do
      it 'raises an error' do
        instance = EventInstance.new(year: '2020')
        expect { instance.save }.to change { instance.errors.count }
      end
    end

    context 'given both an event id and new name' do
      it 'adds an error to the object' do
        event = create(:event)
        instance = EventInstance.new(event_id:              event.id,
                                     new_parent_event_name: 'Super Duper Conf',
                                     year:                  '2020')
        expect { instance.save }.to change { instance.errors.count }
      end
    end
  end
end
