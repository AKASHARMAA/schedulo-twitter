class User < ApplicationRecord
    has_many :twitter_accounts
    has_secure_password
    validates :email , presence: "true", format: { with: /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i , message: "please provide a valid email address"}
end
