Rails.application.config.middleware.use OmniAuth::Builder do
    provider :twitter, File.open("keys-offline.txt").readlines[1].chomp!, File.open("keys-offline.txt").readlines[2].chomp!
end