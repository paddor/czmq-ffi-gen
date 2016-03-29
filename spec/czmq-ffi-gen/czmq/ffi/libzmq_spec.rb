require_relative "spec_helper"

describe CZMQ::FFI::LibZMQ do
  describe ".zmq_errno" do
    it "has function attached" do
      assert_respond_to described_class, :zmq_errno
    end
  end
  describe ".zmq_strerror" do
    it "has function attached" do
      assert_respond_to described_class, :zmq_strerror
    end
  end
  describe ".zmq_version" do
    it "has function attached" do
      assert_respond_to described_class, :zmq_version
    end
  end
end
