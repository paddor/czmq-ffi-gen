# This is only used to be able to read get the last ZMQ error.
module CZMQ::FFI::Errors
  # @return [String] error code of the last (ZMQ) error
  def self.errno
    CZMQ::FFI::LibZMQ.zmq_errno
  end

  # @return [String] the string representation of the last (ZMQ) error
  def self.strerror
    CZMQ::FFI::LibZMQ.zmq_strerror(zmq_errno)
  end
end
