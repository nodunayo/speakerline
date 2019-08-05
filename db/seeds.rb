# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

case Rails.env
  when 'development'

    puts "Starting to run seeds file for development..."

    Submission.destroy_all
    Proposal.destroy_all
    Event.destroy_all
    EventInstance.destroy_all
    Speaker.destroy_all

    20.times { Speaker.create!(name: Faker::Name.unique.name) }
    puts "20 speakers added..."

    5.times { Event.create!(name: "#{Faker::Hacker.adjective.titleize} #{Faker::Hacker.unique.noun.titleize} Conf") }
    %w[2017 2018 2019].each do |year|
      Event.all.each do |event|
        EventInstance.create!(event: event, year: year)
      end
    end
    puts "5 events with 3 instances each added (15 total instances)..."

    [' the ', ' and the '].each do | mid_text |
      10.times { Proposal.create!(title: Faker::Hacker.ingverb.titleize + mid_text + Faker::Hacker.adjective.titleize + " " + Faker::Hacker.noun.titleize, body: Faker::Movies::VForVendetta, speaker_id: Speaker.ids.sample) }
    end
    puts "20 proposals added..."

    Proposal.ids.each do | id |
      event_instance = EventInstance.ids.sample(2)
      Submission.create!(result: [ 0, 1, 2 ].sample, proposal_id: id, event_instance_id: event_instance[0])
      Submission.create!(result: [ 0, 1, 2 ].sample, proposal_id: id, event_instance_id: event_instance[1])
    end
    puts "2 submissions for each proposal added..."
    puts "Finished seeding the development database!"
end
