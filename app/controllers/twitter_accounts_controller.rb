class TwitterAccountsController < ApplicationController
    before_action :require_user_logged_in!
    before_action :set_twitter_account, only: [:destroy]

    def index
    end

    def destroy
        @twitter_account.destroy
        redirect_to home_path, notice: "Your twitter account #{} has been unlinked"
    end

    def set_twitter_account
        @twitter_account = Current.user.twitter_accounts.find_by(id: params[:id])
    end

end