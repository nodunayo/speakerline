Given('there is an event called {string} that has an instance for the year {int}') do |event_name, year|
  event = create(:event, name: event_name)
  create(:event_instance, event: event, year: year)
end

When(/^I add an event instance with the following information:$/) do |table|
  instance_info = table.raw.to_h

  if Event.find_by(name: instance_info['name'])
    page.select(instance_info['name'], from: :event_instance_event_id)
  else
    page.fill_in(:event_instance_new_parent_event_name, with: instance_info['name'])
  end

  page.fill_in(:event_instance_year, with: instance_info['year'])
  page.click_on('Add event')
end

When('I am on the {string} event instance page for the year {int}') do |event_name, year|
  instance = Event.find_by(name: event_name).instances.find_by(year: year)
  page.visit event_instance_path(instance)
end

Then(/^I should see 'This is a great talk' in the 2017 instance block$/) do
  within('#boo-ruby-2017') do
    expect(page).to have_content('This is a great talk')
  end
end
