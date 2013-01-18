module MixRails
  class Railtie < Rails::Railtie 

    config.app_generators.test_framework :rspec
    config.app_generators.integration_tool :rspec
    config.app_generators.view_specs false
    config.app_generators.helper_specs false

  end
end