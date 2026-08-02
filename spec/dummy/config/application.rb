require_relative 'boot'

# The dummy app boots on railties alone. Cre only needs
# Rails.application.credentials, Rails.env and Rails.root - no database,
# no mailers, no assets.
require 'rails'

require 'cre'

module Dummy
  class Application < Rails::Application
    config.load_defaults Rails::VERSION::STRING.to_f
    config.eager_load = false
  end
end
