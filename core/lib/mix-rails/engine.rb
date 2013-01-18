module MixRails
  class Engine < ::Rails::Engine
    puts "==================================="
    puts "Core"
    puts "==================================="
    config.generators do |g|                                                               
      g.test_framework :rspec
      g.integration_tool :rspec
    end
    
  end
end
