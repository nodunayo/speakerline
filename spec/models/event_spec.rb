require 'rails_helper'

RSpec.describe Event do
  describe '#name_and_year' do
    it 'returns the name and the year of the event as a string' do
      event = Event.new(name: 'NadiaConf', year: '2021') 
      expect(event.name_and_year).to eq('NadiaConf 2021')
    end
  end
end
