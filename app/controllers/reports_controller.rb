class ReportsController < ApplicationController
  def index
    @reports = GetRecords.send(params)
    @reports['registrations'].nil? ? @reports = [] : @reports = @reports['registrations']
  end

  def create
  end

  def show
  end

  def update
  end

  def new
  end
end
