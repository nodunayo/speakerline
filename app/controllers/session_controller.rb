require 'faraday'
require 'json'

class SessionController < ApplicationController
  def callback
    code = params["code"]
    response = Faraday.post(
      "https://auth.did.app/oidc/token",
      client_id: "test_0xKvM6N9",
      client_secret: "test_y2650o6pLoxNejD9",
      code: code
    )
    data = JSON.parse(response.body)
    error = data["error"]
    if error
      # Do something with the error
    end
    userinfo = data["userinfo"]
    puts userinfo["email"]
    puts userinfo["email_verified"]

    session[:current_user_id] = userinfo["sub"]
    redirect_to root_path
  end

  def terminate
   reset_session
   redirect_to root_path
 end
end
