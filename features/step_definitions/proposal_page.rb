Given(/^there is a speaker called 'Saron Yitbarek' who has a proposal called 'Reading Code Good' with the body 'Come learn how to read code good\.'$/) do
  speaker = create(:speaker, name: 'Saron Yitbarek')
  create(:proposal, title: 'Reading Code Good', body: 'Come learn how to read code good', speaker: speaker)
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
