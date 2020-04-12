class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authentication_endpoint
    "#{ENV["DID_AUTHENTICATION_ENDPOINT"]}?client_id=#{ENV["DID_CLIENT_ID"] || "test_0xKvM6N9"}&redirect_uri=#{session_callback_url}"
  end
end
