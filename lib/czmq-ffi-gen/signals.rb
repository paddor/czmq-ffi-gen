module CZMQ
  module FFI

    attach_function :zsys_handler_set, [:pointer], :void, blocking: true

    # This is used to disable CZMQ's signal handling so blocking calls can be
    # interrupted using Ctrl-C.
    module Signals
      module_function

      @default_handling_disabled = false

      # Disables default SIGINT/SIGTERM handling of CZMQ.
      # @return [void]
      def disable_default_handling
        FFI.zsys_handler_set(nil)
        @default_handling_disabled = true
      end

      # @return [Boolean] whether the CZMQ's default signal handling has been
      #   disabled
      def default_handling_disabled?
        @default_handling_disabled
      end
    end
  end
end
