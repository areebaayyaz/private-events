class UsersController < ApplicationController
  include UsersHelper

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
    log_in @user
    redirect_to @user
    end
  end

  def show
    @user = User.find(params[:id])
    @created_events=@user.created_events
    @upcoming_events = @user.attended_events.upcoming
    @past_events = @user.attended_events.past
  end

end
    
