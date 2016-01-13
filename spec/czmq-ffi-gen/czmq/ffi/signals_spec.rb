require_relative "spec_helper"

describe CZMQ::FFI::Signals do
  describe ".disable_default_handling" do
    before(:each) do
      expect(CZMQ::FFI).to receive(:zsys_handler_set).with(nil)
        .and_call_original
    end
    it "tells CZMQ" do
      CZMQ::FFI::Signals.disable_default_handling
    end
    after(:each) do
      # reset flag
      CZMQ::FFI::Signals.instance_eval do
        @default_handling_disabled = false
      end
    end
  end

  describe "#default_handling_disabled?" do
    it "returns correct value" do
      refute_operator CZMQ::FFI::Signals, :default_handling_disabled?
      CZMQ::FFI::Signals.disable_default_handling
      assert_operator CZMQ::FFI::Signals, :default_handling_disabled?
    end
  end
end
