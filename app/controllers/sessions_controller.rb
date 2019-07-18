class SessionsController < ApplicationController
  def new
  end

  def create
    @user= User.find_by(name: params[:session][:name])
    if @user
      log_in @user
      redirect_to @user
    else
      flash.now.notice = 'Invalid user name! Try Again.'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
