class TweetsController < ApplicationController
    before_action :require_user_logged_in!

    def post_page 
        @twitter_account_id = params[:twitter_account_id]
    end

    def publish_tweet
        Current.user.twitter_accounts.find_by_id(params[:twitter_account_id]).client.update(params[:body])
        redirect_to home_path, notice: "tweet posted :)"
    end

    def show_tweets 
        
    end
end