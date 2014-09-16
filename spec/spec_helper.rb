require 'database_cleaner'
require 'factory_girl_rails'

require File.expand_path('../../spec/dummy/config/environment', __FILE__)

FactoryGirl.definition_file_paths << File.join(File.dirname(__FILE__), 'factories')
FactoryGirl.reload

RSpec.configure do |config|

  config.order = 'random'
  config.formatter = :documentation

  config.before :suite do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.orm = 'mongoid'
  end

  config.before :each do
    DatabaseCleaner.start
  end

  config.after :each do
    DatabaseCleaner.clean
  end

end