module CZMQ::FFI
  if available?
    opts = {
      blocking: true  # only necessary on MRI to deal with the GIL.
    }

    ##
    # NOTE: this is to support the current stable release, CZMQ 3.0.2
    #
    # attach zsys_has_curve (as zproc_has_curve), if zproc_has_curve isn't
    # available
    unless methods.include? :zproc_has_curve
      attach_function :zproc_has_curve, :zsys_has_curve, [], :bool, **opts
    end
  end
end
