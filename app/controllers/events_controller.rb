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
    @attendees = @event.attendees
    @current_user_attending = @current_user.present? && @attendees.exists?(@current_user.id)
  end

  def index
    @events = Event.all
    @upcoming_events = @events.upcoming
    @past_events = @events.past
  end

  def event_params
    params.require(:event).permit(:description, :event_date)
  end

  def attending
  @current_user.event_attendings.create(attended_event_id: params[:event_id])
  redirect_to events_path   
  end

end
