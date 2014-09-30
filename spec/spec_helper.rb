$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

MODELS = File.join(File.dirname(__FILE__), 'app/models')
$LOAD_PATH.unshift(MODELS)

require 'mongoid_criteria_filter'
require 'rspec'
require 'database_cleaner'

ENV['MONGOID_SPEC_HOST'] ||= 'localhost'
ENV['MONGOID_SPEC_PORT'] ||= '27017'

HOST = ENV['MONGOID_SPEC_HOST']
PORT = ENV['MONGOID_SPEC_PORT'].to_i

CONFIG = {
  :sessions => {
    :default => {
      :database => 'mongoid_criteria_filter_test',
      :hosts => ["#{HOST}:#{PORT}"]
    }
  }
}

Mongoid.configure do |config|
  config.load_configuration(CONFIG)
end

Dir[File.join(MODELS, '*.rb')].sort.each do |file|
  name = File.basename(file, '.rb')
  autoload name.camelize.to_sym, name
end

module Rails
  class Application
  end
end

module MyApp
  class Application < Rails::Application
  end
end

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