require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module AlumniInformationSystem
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    config.generators.javascript_engine = :js
    config.eager_load_paths << "#{Rails.root}/lib/services/**/*.rb"
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.action_cable.url = 'wss://alumni-information-system.herokuapp.com/cable'
    config.action_cable.allowed_request_origins = [ 'https://alumni-information-system.herokuapp.com' ]
  end
end
