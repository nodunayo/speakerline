class EventsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @events = Event.all.order('name ASC')
  end

  def show
    @event = Event.find(params[:id])
  end
end
