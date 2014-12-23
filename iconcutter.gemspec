# encoding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'iconcutter/version'

Gem::Specification.new do |s|
  s.name          = 'iconcutter'
  s.version       = IconCutter::VERSION
  s.authors       = ['lyfeyaj']
  s.email         = ['lyfeyaj@gmail.com']
  s.description   = %q{A icon cut iconcutter verification tool}
  s.summary       = %q{A icon cutter for all platforms, easy to customize and config}
  s.homepage      = 'https://github.com/lyfeyaj/iconcutter'
  s.license       = 'MIT'

  s.files         = `git ls-files`.split($/)
  s.executables   = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ['lib']
  s.executables   = ["iconcutter"]

  s.add_development_dependency 'bundler', ['>= 1.0.0']
  s.add_development_dependency 'rake', ['>= 0']
  s.add_development_dependency 'rspec', ['>= 0']
  s.add_development_dependency 'pry', ['>= 0']
  s.add_development_dependency 'sdoc', ['>= 0']
end
