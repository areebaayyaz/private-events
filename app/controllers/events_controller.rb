class EventsController < ApplicationController

	def new
		@user = User.find(session[:id])
		@created_event = @user.created_events.build
	end

	def create
		@user = User.find(session[:id])
		@created_event = @user.created_events.build(event_params)
		@event.save
	end

	def show
		@event = Event.find(session[:id])
	end

	def index
		@events = Event.all
	end
end
