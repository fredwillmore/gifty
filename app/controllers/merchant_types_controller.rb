class MerchantTypesController < ApplicationController
  def index
    @merchant_types = MerchantType.all
  end

  def show
    @merchant_type = MerchantType.find(params[:id])
  end

  def new
    @merchant_type = MerchantType.new
  end

  def create
    @merchant_type = MerchantType.new(params[:merchant_type])
    if @merchant_type.save
      redirect_to @merchant_type, :notice => "Successfully created merchant type."
    else
      render :action => 'new'
    end
  end

  def edit
    @merchant_type = MerchantType.find(params[:id])
  end

  def update
    @merchant_type = MerchantType.find(params[:id])
    if @merchant_type.update_attributes(params[:merchant_type])
      redirect_to @merchant_type, :notice  => "Successfully updated merchant type."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @merchant_type = MerchantType.find(params[:id])
    @merchant_type.destroy
    redirect_to merchant_types_url, :notice => "Successfully destroyed merchant type."
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def merchant_type_params
    params.require(:merchant_type).permit(:name, :key)
  end

end
