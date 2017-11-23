# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'animal_crossing_api/version'

Gem::Specification.new do |spec|
  spec.name          = 'animal_crossing_api'
  spec.version       = AnimalCrossingAPI::VERSION
  spec.authors       = ['Hunter Braun']
  spec.email         = ['hunter.braun@gmail.com']

  spec.summary       = 'Search the Animal Crossing Wikia'
  spec.description   = 'Get details on villagers and collectables from the Animal Crossing Wikia'
  spec.homepage      = 'https://github.com/goronfreeman/animal_crossing_api'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise 'RubyGems 2.0 or newer is required to protect against public gem pushes.'
  end

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.14'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_dependency 'nokogiri', '~> 1.8'
end
