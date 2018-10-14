class CompaniesController < ApplicationController
  def index
    puts "current_user: #{current_user!}"
    @companies = GetCompanies.send(params)
    @companies['companies'].nil? ? @companies = [] : @companies = @companies['companies']
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
