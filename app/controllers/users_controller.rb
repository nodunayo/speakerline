class UsersController < ApplicationController

  def new
    @user = User.new(speaker: Speaker.new)
  end

  def create
    speaker = Speaker.new(name: params[:name])
    @user = User.new(email: params[:email], speaker: speaker)
    if @user.save
      sign_in(create_passwordless_session(@user))
      redirect_to root_path
    else
      render :new
    end
  end
end
