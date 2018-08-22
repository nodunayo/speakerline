Given('the speaker {string} is in the directory') do |speaker_name|
  @speaker = create(:speaker, name: speaker_name)
end

Given('the speaker {string} is not in the directory') do |speaker_name|
  expect(Speaker.find_by(name: speaker_name)).to be_nil
end

When('I add {string} to the directory') do |speaker_name|
  visit new_speaker_path
  page.fill_in 'speaker_name', with: speaker_name
  page.click_on 'Add'
  @speaker = Speaker.find_by(name: speaker_name)
end

When(/^I go to the speaker directory page$/) do
  visit speakers_path
end
