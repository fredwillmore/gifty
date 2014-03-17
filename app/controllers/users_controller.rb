class UsersController < InheritedResources::Base

  respond_to :html, :xml, :json

  def build_resource_params
    [params.require(:user).permit(:first_name, :last_name, :email, :title, :password, :confirm_password, :locations_attributes=>[:id, :address, :latitude, :longitude, :_destroy])]
  end

  def favorites
    @user = User.find params[:id]
  end

  def friends
    @user = User.find params[:id]
  end

  def friend_search
    users = User.search_name(params[:term]).map do |u|
      {
          label: "#{u.last_name}, #{u.first_name}",
          name: "#{u.last_name}, #{u.first_name}",
          id: u.id
      }
    end
    respond_with users
  end

  def update_favorite
    user = User.find params[:user_id]
    if params[:selected] == 'true'
      user.favorite_merchant_ids += [params[:merchant_id]]
      user.favorite_merchant_ids.uniq!
    else
      user.favorite_merchant_ids -= [params[:merchant_id].to_i]
    end
    user.save!

    # TODO: why doesn't the respond_to up at the top of the file just work for the whole controller? It just doesn't
    respond_to do |format|
      format.json  { render :json => {selected: params[:selected], merchant_id: params[:merchant_id]} }
    end
  end

  #private
  ## Never trust parameters from the scary internet, only allow the white list through.
  #def user_params
  #  params.require(:user).permit(:email, :locations_attributes=>[:id, :address, :latitude, :longitude, :_destroy])
  #end

end
