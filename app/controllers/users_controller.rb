class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      #logs in the given user
    session[:id] = @user.id
    redirect_to @user
    end
  end

  def show
    @user = User.find(params[:id])
    @created_events=@user.created_events
    @upcoming_events = @user.attended_events.upcoming
    @past_events = @user.attended_events.past
  end

  def user_params
    params.require(:user).permit(:name)
  end

end
    
