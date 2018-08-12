Then('I should see {string}') do |content|
  expect(page).to have_content(content)
end

Then('I should not see {string}') do |content|
  expect(page).to_not have_content(content)
end

When('I click on {string}') do |label|
  page.click_on(label)
end

Then("I should be on the {string} page") do |string|
  expect(page).to have_content(string)
end
