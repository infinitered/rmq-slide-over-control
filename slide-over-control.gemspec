# -*- encoding: utf-8 -*-
$:.push File.expand_path('../motion', __FILE__)

VERSION = "0.5.2"

Gem::Specification.new do |spec|
  spec.name          = "rmq-slide-over-control"
  spec.version       = VERSION
  spec.authors       = ["Todd Werth"]
  spec.email         = ["todd@infinitered.com"]
  spec.description   = %q{RubyMotion RMQ plugin: A control that places a draggable view over another view, allowing the user to show more or less of the main view below}
  spec.summary       = %q{RubyMotion RMQ plugin: A control that places a draggable view over another view, allowing the user to show more or less of the main view below}
  spec.homepage      = "https://github.com/infinitered/slide-over-control"
  spec.license       = "MIT"

  files = []
  files << 'README.md'
  files.concat(Dir.glob('motion/**/*.rb'))
  spec.files         = files
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["motion"]

  spec.add_dependency 'ruby_motion_query', '>= 0.8.0'
  spec.add_development_dependency 'rake'
end
