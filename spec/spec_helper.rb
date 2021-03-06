require 'rubygems'
require 'spork'
require 'database_cleaner'
require 'factory_girl_rails'

Spork.prefork do
  ENV['RAILS_ENV'] ||= 'test'
  require File.expand_path('../../config/environment', __FILE__)
  require 'rspec/rails'
  require 'capybara/rspec'

  Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

  DatabaseCleaner.strategy = :truncation

  RSpec.configure do |config|
    config.mock_with :rspec
    config.include FactoryGirl::Syntax::Methods
    config.use_transactional_fixtures = true
    config.infer_base_class_for_anonymous_controllers = false
    config.order = 'random'
    if Bullet.enable?
      config.before(:each) do
        Bullet.start_request
      end
      config.after(:each) do
        Bullet.perform_out_of_channel_notifications if Bullet.notification?
        Bullet.end_request
      end
    end
  end
end

Spork.each_run do
  FactoryGirl.reload
  DatabaseCleaner.clean
end
