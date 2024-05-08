Given('he/she/they has/have a proposal called {string} with the body {string}') do |title, body|
  @proposal = create(:proposal, title: title, body: body, speaker: @speaker)
end

Given('there is a proposal called {string}') do |title|
  @proposal = create(:proposal, title: title, speaker: create(:speaker))
end

Given('he/she/they does/do not have any proposals') do
  expect(Proposal.find_by(speaker_id: @speaker.id)).to be_nil
end

Given(/^I am on the 'Add a Proposal' page$/) do
  visit new_proposal_path
end

Given("there is a proposal called {string} with the tag {string}") do |title, tag|
  @proposal = create(:proposal, title: title, speaker: create(:speaker))
  @proposal.tag_list.add(tag)
  @proposal.save
end

When("I visit the {string} tag page") do |tag|
  visit tag_path(tag)
end

When("I visit the proposals page") do
  visit proposals_path
end

When('I add her/his/their proposal with the following information:') do |table|
  proposal_information = table.raw.to_h
  @tags = proposal_information['tags']
  page.select(@speaker.name, from: :proposal_speaker_id)
  page.fill_in(:proposal_title, with: proposal_information['title'])
  page.fill_in(:proposal_body, with: proposal_information['body'])
  page.fill_in(:proposal_tag_list, with: @tags)
  page.click_on('Save proposal')
end

When('I create a proposal for her/him/them') do
  create(:proposal, speaker: @speaker)
end

When('I visit the proposal page for {string}') do |title|
  proposal = Proposal.find_by(title: title)
  visit proposal_path(proposal)
end

When('I change the title to {string}') do |title|
  page.fill_in(:proposal_title, with: title)
end

Then("I should see the tags") do
  @tags.split(', ').each do |tag|
    expect(page).to have_content("##{tag}")
  end
end
