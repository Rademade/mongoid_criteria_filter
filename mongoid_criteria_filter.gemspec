# encoding: utf-8
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'mongoid_criteria_filter/version'

Gem::Specification.new do |s|
  s.name        = 'mongoid_criteria_filter'
  s.version     = MongoidCriteriaFilter::VERSION
  s.authors     = ['Vladislav Melanitskiy']
  s.email       = %w(co@rademade.com)
  s.homepage    = 'https://github.com/Rademade/mongoid_criteria_filter'
  s.summary     = 'Extension for mongoid.'
  s.description = 'It adds possibility for criteria callbacks (data filters)'
  s.licenses    = ['MIT']

  s.add_dependency 'mongoid'

  s.files = Dir['{lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.rdoc']
  s.test_files = Dir.glob('spec/**/*')
  s.require_path = 'lib'

end