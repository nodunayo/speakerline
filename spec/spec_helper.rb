require 'simplecov'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
  config.shared_context_metadata_behavior = :apply_to_host_groups
  config.example_status_persistence_file_path = 'examples.txt'
end

# Helper to allow testing of parameters in controller specs.
# ActionController::Parameters no longer inherits from Hash,
# which means the approach of expecting the model to have
# received a hash_including the params no longer works.
# from https://stackoverflow.com/questions/39702947/rails-5-rspec-receive-with-actioncontrollerparams#answer-45468322
def strong_params(wimpy_params)
  ActionController::Parameters.new(wimpy_params).permit!
end
