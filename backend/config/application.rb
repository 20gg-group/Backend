require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Api
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # config.middleware.insert_before 0, Rack::Cors do
    #   allow do
    #     origins '*'
    #     # resource '/cors',
    #     #   :headers => :any,
    #     #   :methods => [:post],
    #     #   :max_age => 0
    #     resource 'users', headers: :any, methods: [:get, :post, :delete, :put, :patch, :options, :head]
    #   end
    # end

  end
end
