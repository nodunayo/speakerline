When('I am logged in') do
  @current_user = create(:user)
  session = Passwordless::Session.create(authenticatable: @current_user)
  visit "/users/sign_in/#{session.identifier}/#{session.token}"
end

When('I click on {string}') do |label|
  page.click_on(label)
end

Then('I should see {string}') do |content|
  expect(page).to have_content(content)
end

Then('I should not see {string}') do |content|
  expect(page).to_not have_content(content)
end

Then("I should be on the {string} page") do |page_title|
  expect(page).to have_content(page_title)
end
