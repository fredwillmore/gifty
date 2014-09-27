class Admin::RolesController < ApplicationController
  def index
    @roles = Role.all
  end

  def new
    @role = Role.new
  end

  def edit
    @role = Role.find params[:id]
  end

  def show
    @role = Role.find params[:id]
  end
end
