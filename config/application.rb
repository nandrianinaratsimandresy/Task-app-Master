require_relative 'boot'

require 'rails/all'


Bundler.require(*Rails.groups)

module TaskApp
class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.

    config.time_zone = 'Etc/GMT+9'
    config.active_record.default_timezone = :local
    config.i18n.available_locales = :ja
    config.i18n.default_locale = :en
    config.i18n.fallbacks = true
    config.i18n.enforce_available_locales = false

    config.load_defaults 5.2
    config.generators do |g|
      g.test_framework :rspec,
        fixtures: true,
        view_specs: false,
        helper_specs: true,
        routing_specs: false,
        controller_specs: false,
        request_specs: false
      g.fixture_replacement :factory_bot, dir: "spec/factories"
    end
  end
end
