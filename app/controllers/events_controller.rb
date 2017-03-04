class EventsController < ApplicationController
  def new
    @event = Event.new
  end
end
