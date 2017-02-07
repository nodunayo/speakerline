require 'rails_helper'

RSpec.describe Proposal do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:body) }
end
