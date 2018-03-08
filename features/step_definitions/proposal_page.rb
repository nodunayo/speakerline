Given(/^there is a speaker called 'Saron Yitbarek' who has a proposal called 'Reading Code Good' with the body 'Come learn how to read code good\.'$/) do
  speaker = create(:speaker, name: 'Saron Yitbarek')
  create(:proposal, title: 'Reading Code Good', body: 'Come learn how to read code good', speaker: speaker)
end

Given(/^there is a proposal called 'Reading Code Good'$/) do
  speaker = create(:speaker, name: 'Saron Yitbarek')
  create(:proposal, id: 1, title: 'Reading Code Good', speaker: speaker)
end

Given(/^I am on the 'Reading Code Good' page$/) do
  visit speakers_path
  page.click_on('Saron Yitbarek')
  page.click_on('Reading Code Good')
end

Then(/^I should see 'Come learn how to read code good'$/) do
  expect(page).to have_content('Come learn how to read code good')
end

Given(/^Saron Yitbarek's 'Reading Code Good' was accepted at RailsConf 2014$/) do
  speaker = create(:speaker, name: 'Saron Yitbarek')
  proposal = create(:proposal, title: 'Reading Code Good', body: 'Come learn how to read code good', speaker: speaker)
  create(:event, name: 'RailsConf', id: 5)
  event_instance = create(:event_instance, event_id: 5, year: '2014')
  create(:submission, event_instance: event_instance, proposal: proposal, result: 0)
end

Then(/^I should see a record of the (\w+) (\d+) acceptance$/) do |conf, year|
  expect(page).to have_content("#{conf} #{year} - Accepted")
end

When(/^I add that the proposal was rejected from Boo Ruby in 2017$/) do
  page.click_on('Add submission')
  page.select('Boo Ruby 2017', from: :submission_event_instance_id)
  page.choose('submission_result_rejected')
  page.click_on('Add submission')
end

Given(/^there is an (\d+) instance for the event "([^"]*)" in the system$/) do |year, event_name|
  create(:event, name: event_name, id: 42)
  create(:event_instance, event_id: 42, year: year)
end

Then(/^I should see a record of the Boo Ruby 2017 rejection$/) do
  expect(page).to have_content('Boo Ruby 2017 - Rejected')
end
