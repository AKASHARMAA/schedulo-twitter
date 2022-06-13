class ApplicationController < ActionController::Base
    before_action :set_current_user

    def set_current_user 
        if session[:user_id]
            Current.user = User.find_by_email(session[:user_id])
        end
    end

    def require_user_logged_in!
        redirect_to home_path , alert: "You have to be logged in" if !Current.user
    end
end
