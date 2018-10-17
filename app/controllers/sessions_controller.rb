class SessionsController < ApplicationController

  def create
    response = AuthorizationApi.send(params[:sessions])
    puts response
    response_build = BuildAuthorization.build!(response)
    puts response_build
    return redirect_to login_path() if response_build[:created_at].nil?
    redirect_to root_path(created_at: response_build[:created_at])
  end
end
