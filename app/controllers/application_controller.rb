class ApplicationController < ActionController::Base
  before_action :set_user
  protected
  def set_user
    @current_user = User.find_by(id: session[:id])
  end

  def authenticate_user
    redirect_to root_path, notice: "You're not authenticted user"
  end
end
