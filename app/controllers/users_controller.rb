class UsersController < InheritedResources::Base

  def build_resource_params
    [params.require(:user).permit(:first_name, :last_name, :email, :title, :password, :confirm_password)]
  end

  #def update
  #  @user.update(user_params)
  #  super
  #end
end
