Given(/^there is a proposal called 'This is a great talk' that has been submitted to 'Boo Ruby 2017'$/) do
  event = create(:event, name: 'Boo Ruby', id: 17)
  create(:event_instance, event_id: 17, year: 2017, id: 18)
  create(:proposal, title: 'This is a great talk', id: 3)
  create(:submission, proposal_id: 3, event_instance_id: 18)
end

When(/^I am on the 'Boo Ruby' event page$/) do
  visit event_path(17)
end

Then(/^I should see 'This is a great talk' in the 2017 instance block$/) do
  within('#boo-ruby-2017') do
    expect(page).to have_content('This is a great talk')
  end
end
