class PasswordsController < ApplicationController
    before_action :require_user_logged_in!

    
    def edit 
    end


    def update 
        # Current.user[:password] = params[:password]
        # Current.user[:password_confirmation] = params[:password_confirmation]
        @user = Current.user
        if @user.update(params.permit(:password, :password_confirmation))
            session[:user_id] = nil
            redirect_to "/login", notice: "please login with your new password"
            return
        end
        render :edit
    end
end