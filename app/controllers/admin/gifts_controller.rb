class Admin::GiftsController < ApplicationController

  def index
    @gifts = Gift.all
  end

  def new
    @gift = Gift.new
  end

  def edit
    @gift = Gift.find params[:id]
  end

end
