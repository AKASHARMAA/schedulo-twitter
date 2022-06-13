Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/", to: "home#index", as: :home

  get "/signup", to: "sign_up#create_user", as: :sign_up_get
  post "/signup", to: "sign_up#add_user" , as: :sign_up_post
  get "/login", to: "sessions#login", as: :login_get
  post "/login", to: "sessions#sign_in", as: :login_post 

  get "/logout", to: "sessions#logout", as: :logout

  get "/password", to: "passwords#edit", as: :password_edit_get
  post "/password", to: "passwords#update", as: :password_update_post

  get "password-reset", to: "password_reset#reset", as: :password_reset_get
  post "password-reset", to: "password_reset#reset_handle", as: :password_reset_post 

  get "password-reset/edit", to: "password_reset#edit", as: :password_reset_edit_get
  patch "password-reset/edit", to: "password_reset#update", as: :password_reset_patch

  get "/auth/twitter/callback", to: "oauth#twitter", as: :oauth_twitter_callback

  get "/twitter-accounts", to: "twitter_accounts#index", as: :twitter_accounts_index
  delete "twitter-accounts/:id", to: "twitter_accounts#destroy", as: :twitter_accounts_delete


  get "tweet/post-tweet/:twitter_account_id", to: "tweets#post_page"
  post "tweet/post-tweet/:twitter_account_id", to: "tweets#publish_tweet"
  get "tweets", to: "tweets#show_tweets"

end
