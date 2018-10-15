class EmployeesController < ApplicationController
  before_action :companies?, only: [:new, :edit]
  def index
    authorize Employee
    @employees = GetUsers.send(params)
    @employees['users'].nil? ? @employees = [] : @employees = @employees['users']
  end

  def create
    authorize Employee
    response = CreateEmployee.send(params)
    flash[:danger]  = "#{response['message']} #{response['errors']}" if response['success'] == false
    flash[:notice] = "#{response['message']}" if response['success'] == true
    redirect_to employees_path(created_at: params[:created_at])
  end

  def edit
    authorize Employee
    # @employees = GetUsers.send(params)
    # @employees['users'].nil? ? @employees = {} : @employees = @employees['users'].last
    # raise "#{@employees}"
  end

  def show
    authorize Employee
  end

  def update
    authorize Employee
  end

  def new
    authorize Employee
  end
end
