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

Given(/^I am on Saron Yitbarek's speaker page$/) do
  visit speakers_path
  page.click_on('Saron Yitbarek')
end

When(/^I click on 'Reading Code Good'$/) do
  page.click_on('Reading Code Good')
end

Then(/^I should see 'Come learn how to read code good'$/) do
  expect(page).to have_content('Come learn how to read code good')
end

Given(/^Saron Yitbarek's 'Reading Code Good' was accepted at RailsConf 2014$/) do
  speaker = create(:speaker, name: 'Saron Yitbarek')
  proposal = create(:proposal, title: 'Reading Code Good', body: 'Come learn how to read code good', speaker: speaker)
  event = create(:event, name: 'RailsConf', year: '2014')
  create(:submission, event: event, proposal: proposal, result: 0)
end

Then(/^I should see a record of the RailsConf 2014 acceptance$/) do
  expect(page).to have_content('RailsConf 2014 - Accepted')
end

When(/^I add that the proposal was rejected from Boo Ruby in 2017$/) do
  page.click_on('Add submission')
  page.select('Boo Ruby 2017', from: :submission_event_id)
  page.choose('submission_result_rejected')
  page.click_on('Add submission')
end

Given(/^there is an (\d+) event called "([^"]*)" in the system$/) do |year, event_name|
  create(:event, name: event_name, year: year)
end

Then(/^I should see a record of the Boo Ruby 2017 rejection$/) do
  expect(page).to have_content('Boo Ruby 2017 - Rejected')
end
