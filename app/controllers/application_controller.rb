class ApplicationController < ActionController::Base  
    # UserMailer.example(User.new(email: 'bo@samurails.com')).deliver
    # protect_from_forgery with: :exception
    # before_action :authenticate_user!
    def after_sign_in_path_for(current_user)
        
        home_index_path

    end  
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected
   
          def configure_permitted_parameters
               devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :password , :password_confirmation ,:role)}
   
            #    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:email, :password , :password_confirmation ,:role)}
          end  
end
