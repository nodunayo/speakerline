Given(/^the speaker 'Sandi Metz' is in the directory$/) do
  create(:speaker, name: 'Sandi Metz')
end

Given(/^Sandi already has a proposal$/) do
  create(:proposal, speaker: Speaker.find_by(name: 'Sandi Metz'))
end

Given(/^the speaker 'Lazy Ted' is in the directory$/) do
  create(:speaker, name: 'Lazy Ted')
end

Given(/^Ted does not have any proposals$/) do
  id = Speaker.find_by(name: 'Lazy Ted').id
  expect(Proposal.find_by(speaker_id: id)).to be_nil
end

Given(/^the speaker 'Saron Yitbarek' is in the directory$/) do
  create(:speaker, name: 'Saron Yitbarek')
end

When(/^I go to the speaker directory page$/) do
  visit speakers_path
end

Then(/^I should see 'Sandi Metz'$/) do
  expect(page).to have_content('Sandi Metz')
end

Then(/^I should not see 'Lazy Ted'$/) do
  expect(page).not_to have_content('Lazy Ted')
end

Given(/^'Sandi Metz' has a proposal entitled 'All The Little Things'$/) do
  speaker = create(:speaker, name: 'Sandi Metz')
  create(:proposal, title: 'All The Little Things', body: 'This is a talk about things in code we cannot
         see', speaker: speaker)
end

When(/^I click on 'Sandi Metz'$/) do
  page.click_link('Sandi Metz')
end

Then(/^I should see 'All The Little Things'$/) do
  expect(page).to have_content('All The Little Things')
end

Given(/^the speaker 'Katrina Owen' is not in the directory$/) do
  visit speakers_path
  expect(page).not_to have_content('Katrina Owen')
end

When(/^I add 'Katrina Owen' to the directory$/) do
  visit new_speaker_path
  page.fill_in 'speaker_name', with: 'Katrina Owen'
  page.click_on 'Add'
end

When(/^I create a proposal for Katrina$/) do
  speaker = Speaker.find_by(name: 'Katrina Owen')
  create(:proposal, speaker: speaker)
end

Then(/^I should see 'Katrina Owen'$/) do
  expect(page).to have_content('Katrina Owen')
end
