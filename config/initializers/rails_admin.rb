RailsAdmin.config do |config|
  config.asset_source = :sprockets

  config.authorize_with do
    authenticate_or_request_with_http_basic('Login required') do |username, password|
      expected_username = ENV["RAILS_ADMIN_USERNAME"].to_s
      expected_password = ENV["RAILS_ADMIN_PASSWORD"].to_s
      ActiveSupport::SecurityUtils.secure_compare(username.to_s, expected_username) &
        ActiveSupport::SecurityUtils.secure_compare(password.to_s, expected_password)
    end
  end
  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
