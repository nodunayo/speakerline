class RenameEventsToEventInstances < ActiveRecord::Migration[5.1]
  # Stub models for migration in case they get renamed in the future
  class MyEventInstance < ActiveRecord::Base
    self.table_name = 'event_instances'
  end
  class MyEvent < ActiveRecord::Base
    self.table_name = 'events'
  end

  def up
    rename_event_instances_and_create_new_events_table

    # Creating and naming nu-events isn't directly reversible
    MyEventInstance.all.each do |event_instance|
      ev = MyEvent.create!(name: event_instance.name)
      event_instance.event_id = ev.id
      event_instance.save
    end

    remove_event_instance_name_col
  end

  def down
    revert { remove_event_instance_name_col }

    # Add names back to EventInstance objects in preparation for that becoming required
    # again when they revert to being Event objects.
    # Loop through all Event and EventInstance objects and select related items explicitly,
    # instead of relying on :has_many or any other relations still being in place.
    all_instances = MyEventInstance.all
    MyEvent.all.each do |event|
      # Reduce the number of loops we'll have to do by pre-filtering the array
      instances = all_instances.select { |inst| inst.event_id == event.id }
      instances.each do |instance|
        instance.name = event.name
        instance.save
      end
    end

    revert { rename_event_instances_and_create_new_events_table }
  end

  private

  def rename_event_instances_and_create_new_events_table
    # Rename events to event_instances first, to clear the namespace
    rename_table :events, :event_instances
    # Follow through and rename the association on submissions
    rename_column :submissions, :event_id, :event_instance_id

    # Create the new events table
    create_table :events do |t|
      t.string :name
      t.index  :name, unique: true

      t.timestamps
    end

    # Associate event_instances to events
    add_reference :event_instances, :event, foreign_key: true
  end

  def remove_event_instance_name_col
    remove_column :event_instances, :name, :string
  end
end
