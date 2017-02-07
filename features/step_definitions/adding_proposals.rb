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
