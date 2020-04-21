require_relative 'boot'
require 'rails/all'
Bundler.require(*Rails.groups)
module OnlineProjectManagementSystem
  class Application < Rails::Application
  end
end
