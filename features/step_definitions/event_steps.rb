Given(/^I am on the 'Add an Event' page$/) do
  visit new_event_instance_path
end

Given(/^there is not an event called 'NuConf'$/) do
  if ev = Event.find_by(name:'NuConf')
    ev.destroy
  end
end

When(/^I am on the 'Boo Ruby' event page$/) do
  visit event_path(17)
end

Then(/^I should see a link to the main ([ \w]+) event page$/) do |event|
  event = Event.find_by(name: event)
  expect(page).to  have_link(event.name, href: event_path(event))
end
