Given("{string} was accepted for {string} in {int}") do |proposal_title, event_name, year|
  event = create(:event, name: event_name)
  event_instance = create(:event_instance, event: event, year: year)
  create(:submission, result: :accepted, proposal_id: @proposal.id, event_instance_id: event_instance.id)
end

When("I add that the proposal was {word} for {string} in {int}") do |result, event, year|
  visit proposal_path(@proposal)
  page.click_on('Add submission')
  page.select("#{event} #{year}", from: :submission_event_instance_id)
  page.choose("submission_result_#{result}")
  page.click_on('Add submission')
end

When("I edit the submission to {string}") do |string|
  page.click_on('edit-submission')
  choose("submission_result_#{string}")
  page.click_on("Update submission")
end


Then("I should be on the {string} page") do |string|
  expect(page).to have_content(string)
end

Then("I should see a record of the {string} {int} rejection") do |event, year|
  expect(page).to have_content("#{event} #{year} - Rejected")
end

Then("I should see a record of the {string} {int} acceptance") do |event, year|
  expect(page).to have_content("#{event} #{year} - Accepted")
end
