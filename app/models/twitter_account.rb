class TwitterAccount < ApplicationRecord
  belongs_to :user
  validates :username, uniqueness: true
  

  def client 
    Twitter::REST::Client.new do |config|
      config.consumer_key = File.open("keys-offline.txt").readlines[1].chomp!
      config.consumer_secret = File.open("keys-offline.txt").readlines[2].chomp!
      config.access_token = token 
      config.access_token_secret = secret
    end
  end

end
