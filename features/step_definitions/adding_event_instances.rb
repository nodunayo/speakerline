Given(/^I am on the 'Add an Event' page$/) do
  visit new_event_instance_path
end

Given(/^there is not an event called 'NuConf'$/) do
  if ev = Event.find_by(name:'NuConf')
    ev.destroy
  end
end

Given(/^there is an event called (\w+) that has an instance for the year (\d+)$/) do |conf, year|
  event = create(:event, name: conf)
  create(:event_instance, event: event, year: year)
end

When(/^I add an event instance with the following information:$/) do |table|
  instance_info = table.raw.to_h

  if Event.find_by(name: instance_info['name'])
    page.select(instance_info['name'], from: :event_instance_event_id)
  else
    page.fill_in(:event_instance_new_parent_event_name, with: instance_info['name'])
  end

  page.fill_in(:event_instance_year, with: instance_info['year'])
  page.click_on('Add event')
end

When(/^I add that the proposal was accepted for (\w+) in (\d+)$/) do |conf, year|
  page.click_on('Add submission')
  page.select("#{conf} #{year}", from: :submission_event_instance_id)
  page.choose('submission_result_accepted')
  page.click_on('Add submission')
end
