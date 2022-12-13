RailsAdmin.config do |config|
  config.asset_source = :sprockets

  config.authorize_with do
    authenticate_or_request_with_http_basic('Login required') do |username, password|
      username = Rails.application.secrets.rails_admin_username
      password = Rails.application.secrets.rails_admin_password
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
