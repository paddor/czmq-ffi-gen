require_relative 'spec_helper'

describe CZMQ::FFI do
  it 'has a library version number' do
    refute_nil CZMQ::FFI::VERSION
    refute_nil CZMQ::FFI::LIBRARY_VERSION
    assert_same CZMQ::FFI::LIBRARY_VERSION, CZMQ::FFI::VERSION
  end

  it 'has a gem version number' do
    refute_nil CZMQ::FFI::GEM_VERSION
  end
end

describe CZMQ::FFI::Zconfig do
  context "given a config file" do
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

    let(:zconfig) { described_class.str_load(config_contents) }

    # This is supposed to be a general test, not specific to Zconfig.
    describe "when pointer nullified" do
      Given(:nullified_zconfig) { zconfig.__ptr_give_ref; zconfig } # nullifies pointer
      When(:result) { nullified_zconfig.name }
      Then { result == Failure(CZMQ::FFI::Zconfig::DestroyedError) }
      And { nullified_zconfig.null? }
    end

    describe "getting pointer by reference" do
      When(:ptr_ref) { zconfig.__ptr_give_ref } # nullifies pointer
      Then { zconfig.null? }
      And { ptr_ref.kind_of?(FFI::Pointer) && !ptr_ref.null? }
    end
  end
end
