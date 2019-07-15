class EventsController < ApplicationController
	include EventsHelper

	def new
		@user = User.find(session[:id])
		@created_event = @user.created_events.build
	end

	def create
		@user = User.find(session[:id])
		@created_event = @user.created_events.build(event_params)
		@created_event.save
		redirect_to @user
	end

	def show
		@event = Event.find(params[:id])
	end

	def index
		@events = Event.all
    @upcoming_events = @events.upcoming
    @past_events = @events.past
	end
end
