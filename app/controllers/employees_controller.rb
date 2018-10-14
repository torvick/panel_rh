class EmployeesController < ApplicationController
  before_action :companies?, only: [:new, :edit]
  def index
    @employees = GetUsers.send(params)
    @employees['users'].nil? ? @employees = [] : @employees = @employees['users']
  end

  def create
    response = CreateEmployee.send(params)
    flash[:danger]  = "#{response['message']} #{response['errors']}" if response['success'] == false
    flash[:notice] = "#{response['message']}" if response['success'] == true
    redirect_to employees_path()
  end

  def edit
    # @employees = GetUsers.send(params)
    # @employees['users'].nil? ? @employees = {} : @employees = @employees['users'].last
    # raise "#{@employees}"
  end

  def show
  end

  def update
  end

  def new
  end

  private

  def companies?
    @companies = GetCompanies.send(params)
    @companies['companies'].nil? ? @companies = [] : @companies = @companies['companies']
  end
end
