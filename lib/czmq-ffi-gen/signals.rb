module CZMQ
  module FFI

    attach_function :zsys_handler_set, [:pointer], :void, blocking: true

    # This is used to disable CZMQ's signal handling so blocking calls can be
    # interrupted using Ctrl-C.
    module Signals
      module_function

      # Disables default SIGINT/SIGTERM handling in CZMQ.
      # @return [void]
      def disable_default_handling
        CZMQ::FFI.zsys_handler_set(nil)
      end
    end
  end
end
