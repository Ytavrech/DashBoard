class ApplicationController < ActionController::Base  
    # UserMailer.example(User.new(email: 'bo@samurails.com')).deliver
    # protect_from_forgery with: :exception
    # before_action :authenticate_user!
    def after_sign_in_path_for(current_user)
        # if resource.class == Admin
        jobs_path
        # elsif resource.class == User
            # new_user_session_path
        # end
        # if request.referer == AdminUser
        #   super
        # #   redirect_to admin_roles_path
        # else
          
        # end
    end    
end
