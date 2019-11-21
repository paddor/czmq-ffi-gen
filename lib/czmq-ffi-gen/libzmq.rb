# Bare minimum to get some things directly from the ZMQ library itself
# (without the CZMQ wrapper).
module CZMQ::FFI::LibZMQ
  extend ::FFI::Library

  lib_name = 'libzmq'
  lib_dirs = ['/usr/local/lib', '/opt/local/lib', '/usr/lib64']
  lib_dirs = [*ENV['LIBZMQ_PATH'].split(':'), *lib_dirs] if ENV['LIBZMQ_PATH']
  lib_paths = lib_dirs.map { |path| "#{path}/#{lib_name}.#{::FFI::Platform::LIBSUFFIX}" }
  ffi_lib lib_paths + [lib_name]

  opts = {
    blocking: true  # only necessary on MRI to deal with the GIL.
  }

  attach_function :zmq_strerror, [:int], :string, **opts
  attach_function :zmq_errno, [], :int, **opts
  attach_function :zmq_version, [:pointer, :pointer, :pointer], :void, **opts
end
