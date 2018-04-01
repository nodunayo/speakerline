When("I click to edit the submission") do
  click_link('edit-submission')
end

When("I change the submission to {string}") do |string|
  choose("submission_result_#{string}")
  click_on("Update submission")
end

Then("I should be on the {string} page") do |string|
  expect(page).to have_content(string)
end

Then(/^I should see a record of the (\w+) (\d+) rejection$/) do |conf, year|
  expect(page).to have_content("#{conf} #{year} - Rejected")
end
