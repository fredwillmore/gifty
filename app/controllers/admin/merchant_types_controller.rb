class Admin::MerchantTypesController < ApplicationController
  def index
    @merchant_types = MerchantType.all
  end

  def new
    @merchant_type = MerchantType.new
  end

  def edit
    @merchant_type = MerchantType.find params[:id]
  end

  def show
    @merchant_type = MerchantType.find params[:id]
  end
end
