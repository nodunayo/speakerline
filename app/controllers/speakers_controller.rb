class SpeakersController < ApplicationController
  def index
    @speakers = Speaker.all
  end

  def show
    @speaker = Speaker.find(params[:id])
  end

  def new
    @speaker = Speaker.new
  end

  def create
    speaker = Speaker.create!(speaker_params)
    redirect_to speakers_path
  rescue ActiveRecord::ActiveRecordError
    flash[:alert] = 'Failed to save speaker'
    redirect_to new_speaker_path
  end


  private

  def speaker_params
    params.require(:speaker).permit(:name).to_h
  end
end
