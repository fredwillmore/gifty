class User::ParameterSanitizer < Devise::ParameterSanitizer
  private
  def sign_in
    default_params.permit(self.for(:sign_in))
  end
  def sign_up
    default_params.permit( self.for(:sign_up) + [:first_name, :last_name] )
  end

  def account_update
    default_params.permit( self.for(:account_update) + [:first_name, :last_name] )
  end
end