class MerchantsController < ApplicationController
  before_action :set_merchant, only: [:show, :edit, :update, :destroy]
  respond_to :json

  # GET /merchants
  # GET /merchants.json
  def index
    @merchants = Merchant.all
  end

  # GET /merchants/1
  # GET /merchants/1.json
  def show
  end

  # GET /merchants/new
  def new
    @merchant = Merchant.new
    @merchant.locations.build
    #@merchant.merchant_types.build
  end

  # GET /merchants/1/edit
  def edit
  end

  # POST /merchants
  # POST /merchants.json
  def create
    @merchant = Merchant.new(merchant_params)

    respond_to do |format|
      if @merchant.save
        format.html { redirect_to @merchant, notice: 'Merchant was successfully created.' }
        format.json { render action: 'show', status: :created, location: @merchant }
      else
        format.html { render action: 'new' }
        format.json { render json: @merchant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /merchants/1
  # PATCH/PUT /merchants/1.json
  def update
    respond_to do |format|
      if @merchant.update(merchant_params)
        format.html { redirect_to @merchant, notice: 'Merchant was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @merchant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /merchants/1
  # DELETE /merchants/1.json
  def destroy
    @merchant.destroy
    respond_to do |format|
      format.html { redirect_to merchants_url }
      format.json { head :no_content }
    end
  end

  def get_by_area
    m = Merchant.joins(:locations).where(
      "latitude >= ? AND latitude <= ? AND longitude >= ? AND longitude <= ?",
      params[:s], params[:n], params[:w], params[:e]
    )
    r = []
    m.each do |merchant|
      r << {
        id: merchant.id,
        name: merchant.name,
        merchant_type_keys: merchant.merchant_types.map do |mt| mt.key end,
        merchant_type_names: merchant.merchant_types.map do |mt| mt.name end,
        merchant_type_icon_keys: merchant.merchant_types.map do |mt| mt.icon_key end,
        latitude: merchant.locations.first.latitude,
        longitude: merchant.locations.first.longitude
      }
    end
    respond_with r
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_merchant
      @merchant = Merchant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def merchant_params
#      params[:merchant]
#      params.require(:list).permit(:title, :user_id, :updated_at, :created_at)
      params.require(:merchant).permit(:name, :locations_attributes=>[:id, :address, :latitude, :longitude, :_destroy], :merchant_types_attributes=>[:id, :_destroy])
#      params.require(:merchant).permit(:name)
    end
end
