require_relative "spec_helper"

describe CZMQ::FFI::Zconfig do
  context "with a zconfig" do
    let(:config_contents) do
      <<-EOF
context
    iothreads = 1
    verbose = 1      #   Ask for a trace
main
    type = zqueue    #  ZMQ_DEVICE type
    frontend
        option
            hwm = 1000
            swap = 25000000     #  25MB
        bind = 'inproc:@@//@@addr1'
        bind = 'ipc:@@//@@addr2'
    backend
        bind = inproc:@@//@@addr3
      EOF
    end

    let(:zobj) { described_class.str_load(config_contents) }
    let(:use_pointer) { zobj.name }
    include_examples "a zclass"
  end
end
