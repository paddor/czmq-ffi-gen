# frozen_string_literal: true
require_relative 'lib/czmq-ffi-gen/gem_version'

Gem::Specification.new do |spec|
  spec.name          = "czmq-ffi-gen"
  spec.version       = CZMQ::FFI::GEM_VERSION
  spec.authors       = ["Patrik Wenger"]
  spec.email         = ["paddor@gmail.com"]

  spec.summary       = %q{Generated low-level Ruby binding for CZMQ}
  spec.homepage      = "https://rubygems.org/gems/czmq-ffi-gen"
  spec.license       = "ISC"
  spec.required_ruby_version = Gem::Requirement.new(">= 3.0.0")

  spec.metadata["homepage_uri"]    = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/paddor/czmq-ffi-gen"
  spec.metadata["changelog_uri"]   = "https://github.com/paddor/czmq-ffi-gen/blob/master/CHANGES.md"

  # see http://stackoverflow.com/questions/357754/can-i-traverse-symlinked-directories-in-ruby-with-a-glob#2724048
  spec.files         = Dir['lib/**{,/*/**}/*.rb', # traverse symlinked directory
                           'AUTHORS',
                           'CHANGES.md',
                           'Gemfile',
                           'LICENSE',
                           'README.md',
                       ]
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "ffi", "~> 1.11"

  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 3.10"
  spec.add_development_dependency "minitest" # assertions
end
