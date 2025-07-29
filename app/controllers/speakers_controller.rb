class SpeakersController < ApplicationController
  def index
    @speakers = Speaker.joins(:proposals).distinct.order('name ASC')
  end

  def show
    @speaker = Speaker.find(params[:id])
  end
end
