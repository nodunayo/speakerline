class SpeakersController < ApplicationController
  def index
    @speakers = Speaker.joins(:proposals).distinct.order('name ASC')
  end

  def show
    @speaker = Speaker.find(params[:id])
  end

  def new
    @speaker = Speaker.new
  end

  def create
    @speaker = Speaker.new(speaker_params)
    if verify_recaptcha(model: @speaker) && @speaker.save
      redirect_to speakers_path
    else
      render :new
    end
  end

  private

  def speaker_params
    params.require(:speaker).permit(:name).to_h
  end
end
