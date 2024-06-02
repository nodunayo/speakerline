require_relative "boot"

# RailsAdmin loads every single model a railtie includes, so it crashes when it tries to
# load an ActiveStorage model, since ActiveStorage isn't configured in this app.
# Our solution is to replace rails/all with its components (found here: https://github.com/rails/rails/blob/main/railties/lib/rails/all.rb) and then removing the libraries we don't want loaded at all.

require 'rails'

# Pick the frameworks you want:
require 'active_record/railtie'
# require 'active_storage/engine'
require 'action_controller/railtie'
require 'action_view/railtie'
require 'action_mailer/railtie'
require 'active_job/railtie'
require "action_cable/engine"
# require 'action_mailbox/engine' # disabled because it requires active_storage
# require 'action_text/engine' # disabled because it requires active_storage
require 'rails/test_unit/railtie'



# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Speakerline
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
