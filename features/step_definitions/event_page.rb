Given(/^there is a proposal called 'This is a great talk' that has been submitted to 'Boo Ruby 2017'$/) do
  create(:event, name: 'Boo Ruby', year: 2017, id: 18)
  create(:proposal, title: 'This is a great talk', id: 3)
  create(:submission, proposal_id: 3, event_id: 18)
end

When(/^I am on the 'Boo Ruby (\d+)' event page$/) do |arg1|
  visit event_path(18)
end

Then(/^I should see 'This is a great talk'$/) do
  expect(page).to have_content('This is a great talk')
end
