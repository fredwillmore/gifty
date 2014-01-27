class UsersController < InheritedResources::Base

  def build_resource_params
    [params.require(:user).permit(:first_name, :last_name, :email, :title, :password, :confirm_password, :locations_attributes=>[:id, :address, :latitude, :longitude, :_destroy])]
  end

  def favorites
    @user = User.find params[:id]
  end

  #private
  ## Never trust parameters from the scary internet, only allow the white list through.
  #def user_params
  #  params.require(:user).permit(:email, :locations_attributes=>[:id, :address, :latitude, :longitude, :_destroy])
  #end

end
