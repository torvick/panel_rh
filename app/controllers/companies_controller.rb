class CompaniesController < ApplicationController

  def index
    authorize Company
    @companies = GetCompanies.send(params)
    @companies['companies'].nil? ? @companies = [] : @companies = @companies['companies']
  end

  def create
    authorize Company
  end

  def show
    authorize Company
  end

  def update
    authorize Company
  end

  def new
    authorize Company
  end
end
