class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    event = Event.new(event_params)
    if verify_recaptcha(model: event) && event.save
      redirect_to speakers_path
    else
      flash[:alert] = 'Failed to save event'
      redirect_to new_event_path
    end
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
