# Bare minimum to get some things directly from the ZMQ library itself
# (without the CZMQ wrapper).
module CZMQ::FFI::LibZMQ
  extend ::FFI::Library

  lib_name      = 'libzmq'
  major_version = '5'
  lib_dirs      = ['/usr/local/lib', '/opt/local/lib', '/usr/lib64', '/usr/lib']
  lib_dirs      = [*ENV['LD_LIBRARY_PATH'].split(':'), *lib_dirs] if ENV['LD_LIBRARY_PATH']
  lib_dirs      = [*ENV["#{lib_name.upcase}_PATH"].split(':'), *lib_dirs] if ENV["#{lib_name.upcase}_PATH"]
  lib_paths     = lib_dirs.map do |path|
    [
      "#{path}/#{lib_name}.#{::FFI::Platform::LIBSUFFIX}",
      "#{path}/#{lib_name}.#{::FFI::Platform::LIBSUFFIX}.#{major_version}"
    ]
  end.flatten

  lib_paths.concat [lib_name, "#{lib_name}.#{::FFI::Platform::LIBSUFFIX}.#{major_version}"]

  ffi_lib lib_paths

  opts = {
    blocking: true  # only necessary on MRI to deal with the GIL.
  }

  attach_function :zmq_strerror, [:int], :string, **opts
  attach_function :zmq_errno, [], :int, **opts
  attach_function :zmq_version, [:pointer, :pointer, :pointer], :void, **opts
  attach_function :zmq_has, [:pointer], :int, **opts


  # get ZMQ version
  ptrs = Array.new(3) { ::FFI::MemoryPointer.new(:int) }
  zmq_version(*ptrs)
  VERSION = ptrs.map { |n| n.get_int(0) }.join(".").freeze


  # @param capability [Symbol, String] the name of the capability
  # @return [Boolean] whether the capability is supported
  #
  def self.has?(capability)
    ptr = FFI::MemoryPointer.from_string(capability.to_s.downcase)
    zmq_has(ptr) == 1
  end


  # @return [Boolean] whether the DRAFT API is supported
  def self.has_draft?
    has? :draft
  end


  # @return [Boolean] whether CURVE is supported
  def self.has_curve?
    has? :curve
  end
end
