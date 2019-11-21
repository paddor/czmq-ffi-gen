module CZMQ
  module FFI

    # @return [Boolean] whether the CZMQ DRAFT API is available
    #
    def self.has_draft?
      # NOTE: We use some function that is currently declared DRAFT. Another one
      # might be needed in future versions.
      zsock_new_server(nil)
      true
    rescue NotImplementedError, NoMethodError
      false
    end

  end
end
