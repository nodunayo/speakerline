require 'rails_helper'

RSpec.describe Event do
  subject { create(:event) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:year) }
  it { should validate_numericality_of(:year).only_integer}
  it { should validate_uniqueness_of(:name).scoped_to(:year) }

  describe '#name_and_year' do
    it 'returns the name and the year of the event as a string' do
      event = Event.new(name: 'NadiaConf', year: '2021') 
      expect(event.name_and_year).to eq('NadiaConf 2021')
    end
  end
end
