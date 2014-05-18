lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pushbullet/version'

Gem::Specification.new do |gem|
  gem.name          = 'pushbullet-ruby'
  gem.version       = Pushbullet::VERSION
  gem.authors       = ['Hiroshi Yoshida']
  gem.email         = ['hrysd22@gmail.com']
  gem.summary       = %q{Ruby client of Pushbullet API.}
  gem.description   = %q{Ruby client of Pushbullet API.}
  gem.homepage      = 'https://github.com/hrysd/pushbullet-ruby'
  gem.license       = 'MIT'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}) { |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|gem|features)/})
  gem.require_paths = ['lib']

  gem.add_development_dependency 'bundler'
  gem.add_development_dependency 'pry'
  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec', '~> 3.0.0.beta2'

  gem.add_dependency 'faraday'
  gem.add_dependency 'mime-types'
end
