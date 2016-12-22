class SpeakersController < ApplicationController
  def index
    @speakers = Speaker.all
  end
end
