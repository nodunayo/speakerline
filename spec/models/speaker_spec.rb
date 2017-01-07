require 'rails_helper'

RSpec.describe Speaker do
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
end
