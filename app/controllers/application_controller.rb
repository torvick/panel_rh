class ApplicationController < ActionController::Base

  def current_user!
    @current_user = params[:user_api]
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
