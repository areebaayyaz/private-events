class SessionsController < ApplicationController
  def new
  end

  def create
    @user= User.find_by(name: params[:session][:name])
    if @user
      #logs in the given user
      session[:id] = @user.id
      redirect_to @user
    else
      flash.now.notice = 'Invalid user name! Try Again.'
      render 'new'
    end
  end

  def destroy
    #logs out the current user
    session[:id] = nil
    @current_user = nil
    redirect_to root_url
  end
end
