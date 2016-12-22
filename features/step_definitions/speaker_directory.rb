Given(/^the speaker 'Sandi Metz' is in the directory$/) do
  create(:speaker, name: 'Sandi Metz')
end

When(/^I go to the speaker directory page$/) do
  visit speakers_path
end

Then(/^I should see 'Sandi Metz'$/) do
  expect(page).to have_content('Sandi Metz')
end
