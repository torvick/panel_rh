class ReportsController < ApplicationController
  # before_action :employees?, only: [:new]
  # def index
  #   @reports = GetRecords.send(params)
  #   @reports['registrations'].nil? ? @reports = [] : @reports = @reports['registrations']
  # end
  #
  # def create
  #   response = CreateRecord.send(params)
  #   flash[:danger]  = "#{response['message']} #{response['errors']}" if response['success'] == false
  #   flash[:notice] = "#{response['message']}" if response['success'] == true
  #   redirect_to reports_path()
  # end
  #
  # def show
  # end
  #
  # def update
  # end
  #
  # def new
  # end
  
  def index
    authorize Report
  end

  def create
    authorize Report
  end

  def show
    authorize Report
  end
end
