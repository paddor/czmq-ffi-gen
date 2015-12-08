require_relative "czmq-ffi-gen/czmq/ffi"
require_relative "czmq-ffi-gen/gem_version"
require_relative "czmq-ffi-gen/library_version"
CZMQ::FFI.available? or raise LoadError, "libczmq is not available"
