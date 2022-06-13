class OauthController < ApplicationController

    def twitter 
        user_details_oauth = auth_helper
        # deleting previous twitter account record for the same username 
        if Current.user.twitter_accounts.find_by(username: user_details_oauth.info.nickname)
            Current.user.twitter_accounts.find_by(username: user_details_oauth.info.nickname).destroy
        end
        
        Current.user.twitter_accounts.create(
            name: user_details_oauth.info.name,
            username: user_details_oauth.info.nickname,
            image: user_details_oauth.info.image,
            token: user_details_oauth.credentials.token,
            secret: user_details_oauth.credentials.secret
        )

        redirect_to home_path, notice: "Your twitter account has successfully been registered with us"
    end

    def auth_helper
        return request.env["omniauth.auth"]
    end

end