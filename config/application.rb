require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module GrowwCapital
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    if Rails.env == 'development'
      config.action_mailer.asset_host = 'http://localhost:3000'
    else
      config.action_mailer.asset_host = 'https://growwcapital.com'
    end
    YAML.load_file("#{Rails.root}/config/config.yml").each { |k, v| config.send "#{k}=", v }
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
