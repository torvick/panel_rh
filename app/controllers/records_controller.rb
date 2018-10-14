class RecordsController < ApplicationController
  before_action :employees?, only: [:new, :edit]
  def index
    @reports = GetRecords.send(params)
    @reports['registrations'].nil? ? @reports = [] : @reports = @reports['registrations']
  end

  def create
    response = CreateRecord.send(params)
    flash[:danger]  = "#{response['message']} #{response['errors']}" if response['success'] == false
    flash[:notice] = "#{response['message']}" if response['success'] == true
    redirect_to records_path()
  end

  def show
  end

  def update
    response = CreateCheckOut.send(params)
    flash[:danger]  = "#{response['message']} #{response['errors']}" if response['success'] == false
    flash[:notice] = "#{response['message']}" if response['success'] == true
    redirect_to records_path()
  end

  def new
  end

  def edit
  end
end
