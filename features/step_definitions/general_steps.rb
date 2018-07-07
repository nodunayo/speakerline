Then('I should see {string}') do |content|
  expect(page).to have_content(content)
end

Then('I should not see {string}') do |content|
  expect(page).to_not have_content(content)
end
