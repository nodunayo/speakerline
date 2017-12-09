class EventsController < ApplicationController

  def index
    @events = Event.all.order('name ASC')
  end

  def show
    @event = Event.find(params[:id])
  end
end
