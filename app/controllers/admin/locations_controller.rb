class Admin::LocationsController < ApplicationController
  def index
    @locations = Location.all
  end

  def new
    @location = Location.new
  end

  def edit
    @location = Location.find params[:id]
  end

  def show
    @location = Location.find params[:id]
  end
end
