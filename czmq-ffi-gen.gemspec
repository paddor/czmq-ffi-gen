# coding: utf-8
require_relative 'lib/czmq-ffi-gen/gem_version'

Gem::Specification.new do |spec|
  spec.name          = "czmq-ffi-gen"
  spec.version       = CZMQ::FFI::GEM_VERSION
  spec.authors       = ["Patrik Wenger"]
  spec.email         = ["paddor@gmail.com"]

  spec.summary       = %q{The low-level Ruby binding for CZMQ (generated using zproject)}
  spec.homepage      = "https://github.com/paddor/czmq-ffi-gen"
  spec.license       = "ISC"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "ffi"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rspec-given"
  spec.add_development_dependency "minitest"
end
