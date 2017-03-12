When(/^I click 'Edit Proposal'/) do
  page.click_on('Edit proposal')
end

When(/^I change the title to 'Reading Code Well'/) do
  page.fill_in(:proposal_title, with: 'Reading Code Well')
end

When(/^I click 'Update Proposal'/) do
  page.click_on('Update proposal')
end

Then(/I should see 'Reading Code Well'/) do
  expect(page).to have_content("Reading Code Well")
end

Then(/I should not see 'Reading Code Good'/) do
  expect(page).to_not have_content("Reading Code Good")
end

