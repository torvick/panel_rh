class ApplicationController < ActionController::Base
  before_action :current_user!

  def current_user!
    redis = Redis.new(host: "redis-12668.c90.us-east-1-3.ec2.cloud.redislabs.com", port: 12668, password: 'Pk05hBCLwADjuJomBufSSWruji0zjFGh')
    @current_user = redis.get(params[:created_at])
    params[:current_user] = @current_user
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
end
