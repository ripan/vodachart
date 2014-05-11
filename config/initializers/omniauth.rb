OmniAuth.config.full_host = ENV['HOSTNAME']
OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']
  provider :google, ENV['GOOGLE_KEY'], ENV['GOOGLE_SECRET'], :scope => 'https://mail.google.com/mail/feed/atom/' 
  provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET'], :scope => 'publish_stream' 
  provider :identity, 
  :fields => [:email,:name, :role],
  :on_failed_registration => lambda { |env|
    IdentitiesController.action(:new).call(env)
  }
end
