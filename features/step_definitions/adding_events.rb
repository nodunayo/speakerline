Given(/^I am on the 'Add an Event' page$/) do
  visit new_event_path
end

When(/^I add an event with the following information:$/) do |table|
  event_information = table.raw.to_h
  page.fill_in(:event_name, with: event_information['name'])
  page.fill_in(:event_year, with: event_information['year'])
  page.click_on('Add event')
end

When(/^I add that the proposal was accepted for RailsConf in 2014$/) do
  page.click_on('Add submission')
  page.select('RailsConf 2014', from: :submission_event_id)
  page.choose('submission_result_accepted')
  page.click_on('Add submission')
end
