module CZMQ
  module FFI
    # CZMQ library version
    CZMQ_VERSION = VERSION

    # @deprecated Use {CZMQ_VERSION} instead.
    LIBRARY_VERSION = CZMQ_VERSION

    # ZMQ library version
    ZMQ_VERSION = LibZMQ::VERSION
  end
end
