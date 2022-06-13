class SessionsController < ApplicationController
    def login
        @user = User.new
        render :login_page
    end

    def sign_in
        @user = User.find_by(email: params[:email])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user[:email]
            redirect_to "/", notice: "you have been sucessfully logged in :)"
        else
            flash[:alert] = "email or password incorrect - please try again..."
            render :login_page
        end
    end

    def logout 
        session[:user_id] = nil
        redirect_to "/", notice: "you have been logged out"
    end
end