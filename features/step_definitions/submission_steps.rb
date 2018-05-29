Given(/^Saron Yitbarek's 'Reading Code Good' was accepted at RailsConf 2014$/) do
  speaker = create(:speaker, name: 'Saron Yitbarek')
  proposal = create(:proposal, title: 'Reading Code Good', body: 'Come learn how to read code good', speaker: speaker)
  create(:event, name: 'RailsConf', id: 5)
  event_instance = create(:event_instance, event_id: 5, year: '2014')
  create(:submission, event_instance: event_instance, proposal: proposal, result: 0)
end

When(/^I add that the proposal was accepted for (\w+) in (\d+)$/) do |conf, year|
  page.click_on('Add submission')
  page.select("#{conf} #{year}", from: :submission_event_instance_id)
  page.choose('submission_result_accepted')
  page.click_on('Add submission')
end

When("I click to edit the submission") do
  click_link('edit-submission')
end

When("I change the submission to {string}") do |string|
  choose("submission_result_#{string}")
  click_on("Update submission")
end

When(/^I add that the proposal was rejected from Boo Ruby in 2017$/) do
  page.click_on('Add submission')
  page.select('Boo Ruby 2017', from: :submission_event_instance_id)
  page.choose('submission_result_rejected')
  page.click_on('Add submission')
end

Then("I should be on the {string} page") do |string|
  expect(page).to have_content(string)
end

Then("I should see a record of the {string} {int} rejection") do |event, year|
  expect(page).to have_content("#{event} #{year} - Rejected")
end

Then("I should see a record of the {string} {int} acceptance") do |event, year|
  expect(page).to have_content("#{event} #{year} - Accepted")
end
