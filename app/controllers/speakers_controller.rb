class SpeakersController < ApplicationController
  def index
    @speakers = Speaker.all
  end

  def show
    @speaker = Speaker.find(params[:id])
  end
end
