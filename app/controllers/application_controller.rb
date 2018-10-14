class ApplicationController < ActionController::Base

  def current_user!
    @current_user = params[:user_api]
  end
end
