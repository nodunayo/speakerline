class EventInstancesController < ApplicationController
  def new
    @events = Event.all.order(name: :asc)
    @event_instance = EventInstance.new
  end

  def create
    @event_instance = EventInstance.new(event_instance_params)
    if verify_recaptcha(model: @event_instance) && @event_instance.save
      redirect_to speakers_path
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
