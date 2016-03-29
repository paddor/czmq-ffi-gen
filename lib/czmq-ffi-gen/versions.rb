require_relative "gem_version"
require_relative "libzmq"

module CZMQ
  module FFI
    # CZMQ library version
    CZMQ_VERSION = VERSION

    # @deprecated Use {CZMQ_VERSION} instead.
    LIBRARY_VERSION = CZMQ_VERSION

    # ZMQ library version
    ZMQ_VERSION = begin
      version = Array.new(3) { ::FFI::MemoryPointer.new(:int) }
      LibZMQ.zmq_version(*version)
      version.map { |n| n.get_int(0) }.join(".")
    end
  end
end
