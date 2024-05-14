require 'rails_helper'

RSpec.describe Proposal do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:body) }

  it 'can only have up to 3 tags' do
    proposal = create(:proposal)
    proposal.tag_list.add("this", "is", "a", "great", "proposal")
    proposal.valid?
    expect(proposal.errors[:base]).to include("must only have a maximum of 3 tags")
  end

  it 'searches proposals' do
    proposal1 = create(:proposal, title: "Rails is awesome")
    proposal2 = create(:proposal, title: "Hotwire is amazing")
    search_results = Proposal.search("amazing")
    expect(search_results).not_to include(proposal1)
    expect(search_results).to include(proposal2)
  end
end
