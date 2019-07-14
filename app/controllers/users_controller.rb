class UsersController < ApplicationController
  include UsersHelper

  def index
    
  end

  def new
		@user = User.new
	end

	def create
    @user = User.new(user_params)
    if @user.save
    log_in @user
    end
  end

	def show
		@user = User.find(params[:id])
	end

end
    