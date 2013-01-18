module MixRails::Concerns::Engine
  extend ActiveSupport::Concern  

  # Adds the defaults configurations to the engine based on mix-rails
  included do
    config.generators do |g|                                                               
      g.test_framework :rspec
      g.integration_tool :rspec
    end
  end

  module ClassMethods
    
  end

end