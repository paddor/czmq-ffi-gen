# This is only used to be able to read get the last ZMQ error.
module CZMQ::FFI::Errors
  extend ::FFI::Library

  lib_name = 'libzmq'
  lib_paths = ['/usr/local/lib', '/opt/local/lib', '/usr/lib64']
    .map { |path| "#{path}/#{lib_name}.#{::FFI::Platform::LIBSUFFIX}" }
  ffi_lib lib_paths + [lib_name]

  opts = {
    blocking: true  # only necessary on MRI to deal with the GIL.
  }

  attach_function :zmq_strerror, [:int], :string, **opts
  attach_function :zmq_errno, [], :int, **opts

  # @return [String] error code of the last (ZMQ) error
  def self.errno
    zmq_errno
  end

  # @return [String] the string representation of the last (ZMQ) error
  def self.strerror
    zmq_strerror(zmq_errno)
  end
end
