class RecordsController < ApplicationController
  before_action :employees?, only: [:new, :edit]
  def index
    authorize Record
    @reports = GetRecords.send(params)
    @reports['registrations'].nil? ? @reports = [] : @reports = @reports['registrations']
  end

  def create
    authorize Record
    response = CreateRecord.send(params)
    flash[:danger]  = "#{response['message']} #{response['errors']}" if response['success'] == false
    flash[:notice] = "#{response['message']}" if response['success'] == true
    return redirect_to records_path(employee_id: params[:employee_id], created_at: params[:created_at]) if !params[:employee_id].nil?
    redirect_to records_path(created_at: params[:created_at])
  end

  def show
    authorize Record
  end

  def update
    authorize Record
    response = CreateCheckOut.send(params)
    flash[:danger]  = "#{response['message']} #{response['errors']}" if response['success'] == false
    flash[:notice] = "#{response['message']}" if response['success'] == true
    redirect_to records_path(created_at: params[:created_at])
  end

  def new
    authorize Record
  end

  def edit
    authorize Record
  end
end
