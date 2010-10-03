require 'acts_as_sanitiled'
require 'rails'

module ActsAsSanitiled
  class Railtie < Rails::Railtie
    railtie_name :acts_as_sanitiled
    
    initializer "acts_as_sanitiled.configure_rails_initialization" do
      ActiveRecord::Base.send(:include, ActsAsSanitiled)
    end
  end
end