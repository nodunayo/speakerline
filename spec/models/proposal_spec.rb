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
end
