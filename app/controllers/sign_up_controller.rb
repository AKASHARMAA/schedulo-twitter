class SignUpController < ApplicationController
    def create_user
        @user = User.new
    end

    def add_user
        paramUser = params[:user]
        @user = User.new(email: paramUser["email"],password: paramUser["password"],password_confirmation: paramUser["password_confirmation"])
        if @user.save
            session[:email] = paramUser[:email]
            redirect_to "/" , notice: "sucessfully created your account :)"
        else
            render :create_user
        end
    end

    
end