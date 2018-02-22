require 'rails_helper'

RSpec.describe Event do
  subject { create(:event) }

  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
end


