require 'faraday'
require 'json'

class SessionController < ApplicationController
  def callback
    code = params["code"]
    if Rails.env != "test"
      response = Faraday.post(
        "https://auth.did.app/oidc/token",
        client_id: ENV["DID_CLIENT_ID"] || "test_0xKvM6N9",
        client_secret: ENV["DID_CLIENT_ID"] || "test_y2650o6pLoxNejD9",
        code: code
      )
      data = JSON.parse(response.body)
      error = data["error"]
      if error
        flash[:alert] = "Something went wrong signing you in"
        redirect_to root_path
      else
        userinfo = data["userinfo"]
        puts userinfo["email"]
        puts userinfo["email_verified"]

        session[:current_user_id] = userinfo["sub"]
        redirect_to root_path
      end
    else
      session[:current_user_id] = "123"
      redirect_to root_path
    end
  end

  def terminate
    reset_session
    redirect_to root_path
  end
end
