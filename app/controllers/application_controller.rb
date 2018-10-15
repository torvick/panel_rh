class ApplicationController < ActionController::Base
  before_action :current_user
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def current_user
    redis = Redis.new(host: "redis-12668.c90.us-east-1-3.ec2.cloud.redislabs.com", port: 12668, password: 'Pk05hBCLwADjuJomBufSSWruji0zjFGh')
    params[:current_user] = redis.get(params[:created_at])
    current_user = params[:current_user]
    @current_user = current_user
  end

  private

  def companies?
    @companies = GetCompanies.send(params)
    @companies['companies'].nil? ? @companies = [] : @companies = @companies['companies']
  end

  def employees?
    @employees = GetUsers.send(params)
    @employees['users'].nil? ? @employees = [] : @employees = @employees['users']
    # raise "#{@employees}"
  end

  def user_not_authorized
    render :file => "#{Rails.root}/public/404.html",  layout: false, status: :not_found
  end
end
