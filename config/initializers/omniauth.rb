# config/initializers/omniauth.rb
Rails.application.config.middleware.use OmniAuth::Builder do
  #provider :github,        ENV['GITHUB_KEY'],   ENV['GITHUB_SECRET'],   scope: 'email,profile'
  #provider :facebook,      ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']
  provider :google_oauth2, "674449033922-u0k8no0grpkclntu0garorb3fvgfqk33.apps.googleusercontent.com", "rYwP4JEhUWp503TdgZA08wC3"
end
