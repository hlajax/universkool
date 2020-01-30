class ApplicationController < ActionController::Base
	  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  
      #def after_sign_in_path_for(administrateur)
       #dashboard_index_path
     #end
	
	
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation, :nom, :ville, :telephone,  :age, :formation, :bulletin, :certificat, :carte, :pere, :mere])
	 devise_parameter_sanitizer.permit(:account_update, keys: [:email, :password, :password_confirmation, :nom, :ville, :telephone,  :age,  :formation, :bulletin, :certificat, :carte, :pere, :mere, :current_password])
  end
end
