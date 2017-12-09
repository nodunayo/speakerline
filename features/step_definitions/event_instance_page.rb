When(/^I am on the ([ \w]+) event instance page for (\d+)$/) do |event, year|
  instance = Event.find_by(name: event).instances.find_by(year: year)
  visit event_instance_path(instance)
end

Then(/^I should see the proposal '([ \w]+)'$/) do |proposal|
  expect(page).to have_content(proposal)
end

Then(/^I should see a link to the main ([ \w]+) event page$/) do |event|
  event = Event.find_by(name: event)
  expect(page).to  have_link(event.name, href: event_path(event))
end
