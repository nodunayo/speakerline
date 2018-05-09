Given(/^there is a proposal called 'This is a great talk' that has been submitted to 'Boo Ruby 2017'$/) do
  event = create(:event, name: 'Boo Ruby', id: 17)
  create(:event_instance, event_id: 17, year: 2017, id: 18)
  create(:proposal, title: 'This is a great talk', id: 3)
  create(:submission, proposal_id: 3, event_instance_id: 18)
end

Given('he/she/they has/have a proposal called {string} with the body {string}') do |title, body|
  create(:proposal, title: title, body: body, speaker: @speaker)
end

Given(/^there is a proposal called 'Reading Code Good'$/) do
  speaker = create(:speaker, name: 'Saron Yitbarek')
  create(:proposal, id: 1, title: 'Reading Code Good', speaker: speaker)
end

Given(/^Sandi already has a proposal$/) do
  create(:proposal, speaker: Speaker.find_by(name: 'Sandi Metz'))
end

Given(/^Ted does not have any proposals$/) do
  id = Speaker.find_by(name: 'Lazy Ted').id
  expect(Proposal.find_by(speaker_id: id)).to be_nil
end

Given(/^'Sandi Metz' has a proposal entitled 'All The Little Things'$/) do
  speaker = create(:speaker, name: 'Sandi Metz')
  create(:proposal, title: 'All The Little Things', body: 'This is a talk about things in code we cannot
         see', speaker: speaker)
end

Given(/^I am on the 'Add a Proposal' page$/) do
  visit new_proposal_path
end

When(/^I add her proposal with the following information:$/) do |table|
  proposal_information = table.raw.to_h
  page.select('Saron Yitbarek', from: :proposal_speaker_id)
  page.fill_in(:proposal_title, with: proposal_information['title'])
  page.fill_in(:proposal_body, with: proposal_information['body'])
  page.click_on('Add proposal')
end

When(/^I visit the proposal page for 'Reading Code Good'$/) do
  visit speakers_path
  page.click_on('Saron Yitbarek')
  page.click_on('Reading Code Good')
end

When(/^I click 'Edit Proposal'/) do
  page.click_on('Edit proposal')
end

When(/^I change the title to 'Reading Code Well'/) do
  page.fill_in(:proposal_title, with: 'Reading Code Well')
end

When(/^I click 'Update Proposal'/) do
  page.click_on('Update proposal')
end

When(/^I create a proposal for Katrina$/) do
  speaker = Speaker.find_by(name: 'Katrina Owen')
  create(:proposal, speaker: speaker)
end

Then(/I should see 'Reading Code Well'/) do
  expect(page).to have_content("Reading Code Well")
end

Then(/I should not see 'Reading Code Good'/) do
  expect(page).to_not have_content("Reading Code Good")
end

Then(/^I should see the proposal '([ \w]+)'$/) do |proposal|
  expect(page).to have_content(proposal)
end

Then(/^I should see 'All The Little Things'$/) do
  expect(page).to have_content('All The Little Things')
end

Then(/^I should see 'Come learn how to read code good'$/) do
  expect(page).to have_content('Come learn how to read code good')
end
