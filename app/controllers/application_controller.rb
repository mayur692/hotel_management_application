class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, unless: :home_controller?
    
  protected

    def after_sign_in_path_for(resource)
        # Logic to determine the path, for example:
        dashboard_index_path
    end

    def after_sign_out_path_for(resource)
        root_path
    end    

    def home_controller?
        controller_name == "home"
    end
  
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    end

end
