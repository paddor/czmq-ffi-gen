require_relative "spec_helper"

describe CZMQ::FFI::Errors do
  describe ".errno" do
    before(:each) do
      expect(CZMQ::FFI::Errors).to receive(:zmq_errno).and_return(666)
    end
    it "returns last errno" do
      assert_equal 666, CZMQ::FFI::Errors.errno
    end
  end
  describe ".strerror" do
    before(:each) do
      expect(CZMQ::FFI::Errors).to receive(:zmq_errno).and_return(22) # EINVAL
    end

    it "returns error string" do
      assert_equal "Invalid argument", CZMQ::FFI::Errors.strerror
    end
  end
end
