require 'rails_helper'

RSpec.describe Submission do
  it { should validate_presence_of(:event_instance) }
  it { should validate_presence_of(:proposal) }
  it { should validate_presence_of(:result) }
  it { should define_enum_for(:result).with([:accepted, :rejected, :waitlisted]) }
end
