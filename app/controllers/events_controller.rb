class EventsController < ApplicationController

before_action :authenticate_user, only: [:new, :create]
  def new
    @created_event = Event.new
  end

  def create
    @created_event = @current_user.created_events.build(event_params)
    @created_event.save
    redirect_to @current_user
  end

  def show
    @event = Event.find(params[:id])
  end

  def index
    @events = Event.all
    @upcoming_events = @events.upcoming
    @past_events = @events.past
  end

  def event_params
    params.require(:event).permit(:description, :event_date)
  end

end
