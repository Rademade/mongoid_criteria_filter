#encoding: utf-8

#$:.push File.expand_path('../lib', __FILE__)

Gem::Specification.new do |s|
  s.name        = 'mongoid_criteria_filter'
  s.version     = '0.0.0'
  s.authors     = ['Vladislav Melanitskiy']
  s.email       = %w(co@rademade.com)
  s.homepage    = 'https://github.com/Rademade/rademade_admin'
  s.summary     = 'Extension for mongoid.'
  s.description = 'It adds possibility for criteria callbacks (data filters)'
  s.licenses    = ['MIT']

  s.files = Dir['{config}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.rdoc']

  s.add_dependency 'rails', '~> 4.0'
  s.add_dependency 'mongoid', '~> 4.0'

end