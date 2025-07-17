class EventInstancesController < ApplicationController
  before_action :require_user!, only: [:new, :create]

  def new
    @events = Event.all.order(name: :asc)
    @event_instance = EventInstance.new
  end

  def create
    @event_instance = EventInstance.new(event_instance_params)
    if @event_instance.save
      flash[:notice] = 'Event created successfully!'

      redirect_to events_path
    else
      @events = Event.all.order(name: :asc)

      render 'new'
    end
  end

  def show
    @event_instance = EventInstance.find(params[:id])
  end

  private

  def event_instance_params
    params.require(:event_instance).permit(:event_id, :new_parent_event_name, :year)
  end
end
