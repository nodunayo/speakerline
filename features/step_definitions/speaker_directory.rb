Given(/^the speaker 'Sandi Metz' is in the directory$/) do
  create(:speaker, name: 'Sandi Metz')
end

When(/^I go to the speaker directory page$/) do
  visit speakers_path
end

Then(/^I should see 'Sandi Metz'$/) do
  expect(page).to have_content('Sandi Metz')
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

Then(/^I should see 'Katrina Owen'$/) do
  expect(page).to have_content('Katrina Owen')
end
