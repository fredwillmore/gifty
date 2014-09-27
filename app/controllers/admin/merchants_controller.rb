class Admin::MerchantsController < ApplicationController
  def index
    @merchants = Merchant.all
  end

  def new
    @merchant = Merchant.new
  end

  def edit
    @merchant = Merchant.find params[:id]
  end

  def show
    @merchant = Merchant.find params[:id]
  end
end
