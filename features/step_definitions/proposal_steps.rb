Given('he/she/they has/have a proposal called {string} with the body {string}') do |title, body|
  @proposal = create(:proposal, title: title, body: body, speaker: @speaker)
end

Given('there is a proposal called {string}') do |title|
  speaker = create(:speaker)
  @proposal = create(:proposal, title: title, speaker: speaker)
end

Given('he/she/they does/do not have any proposals') do
  expect(Proposal.find_by(speaker_id: @speaker.id)).to be_nil
end

Given(/^I am on the 'Add a Proposal' page$/) do
  visit new_proposal_path
end

When('I add her/his/their proposal with the following information:') do |table|
  proposal_information = table.raw.to_h
  page.select(@speaker.name, from: :proposal_speaker_id)
  page.fill_in(:proposal_title, with: proposal_information['title'])
  page.fill_in(:proposal_body, with: proposal_information['body'])
  page.click_on('Add proposal')
end

When('I visit the proposal page for {string}') do |title|
  proposal = Proposal.find_by(title: title)
  visit proposal_path(proposal)
end

When('I change the title to {string}') do |title|
  page.fill_in(:proposal_title, with: title)
end

When('I create a proposal for her/him/them') do
  create(:proposal, speaker: @speaker)
end
