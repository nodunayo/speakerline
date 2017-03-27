class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    event = Event.create!(event_params)
    redirect_to speakers_path
  rescue ActiveRecord::ActiveRecordError
    flash[:alert] = 'Failed to save event'
    redirect_to new_event_path
  end

  def index
    @events = Event.all.order('name ASC, year ASC')
  end

  def show
    @event = Event.find(params[:id])
  end

  private

  def event_params
    params.require(:event).permit(:name, :year)
  end
end
