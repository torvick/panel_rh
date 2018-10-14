class SessionsController < ApplicationController

  def create
    puts params.inspect
    response = AuthorizationApi.send(params[:sessions])
    # puts response[:access_token]
    # puts response['access_token']
    # return render json:  { success: false, message: 'credential incorrect!'} if response['access_token'].nil?
    # response_build = BuildAuthorization.build!(response)
    return render json:  { success: false, message: 'credential incorrect!'} if response['access_token'].nil?
    params[:user_api] = response['access_token']
    params[:authenticity_token] = response['access_token']
    current_user!
    puts current_user!
    redirect_to home_index_path()
  end
end
