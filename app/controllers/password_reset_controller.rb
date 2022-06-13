class PasswordResetController < ApplicationController

    def reset
    end


    def reset_handle
        @user = User.find_by(email: params[:email])
        if @user
            # send email
            PasswordMailer.with(user: @user).reset.deliver_later
            redirect_to home_path , notice: "please check your inbox for a password reset email..."
            return
        end
        render :reset
    end


    def edit
        @token = params[:token]
        @user = User.find_signed(params[:token], purpose: "password_reset")
    end


    def update
        @user = User.find_signed(params[:token], purpose: "password_reset")
        if @user && @user.update(params.permit(:password, :password_confirmation))
            redirect_to login_get_path , notice: "password reset successfully!! You can login with your new password :)"
            return
        elsif @user && @user.errors.any?
            render :edit
            return
        end
        redirect_to home_path , alert: "Something went wrong :("
    end
    
end