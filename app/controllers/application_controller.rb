class ApplicationController < ActionController::Base  

    def after_sign_in_path_for(current_user)
        home_index_path
    end  
    before_action :configure_permitted_parameters, if: :devise_controller?

    private   
    def configure_permitted_parameters
               devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :password , :password_confirmation ,:role)}
    end  
end
