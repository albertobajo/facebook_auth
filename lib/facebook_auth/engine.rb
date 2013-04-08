require "auth_helpers"
require "omniauth"
require "omniauth-facebook"

module FacebookAuth
  class Engine < ::Rails::Engine
    engine_name "facebook_auth"
    isolate_namespace FacebookAuth
    
    config.generators do |g|
      g.test_framework :rspec, view_specs: false
    end
    
    initializer 'auth_helpers' do |app|
      ActiveSupport.on_load :action_controller do
        include AuthHelpers
      end
    end
  end
end
