require_relative "spec_helper"

describe CZMQ::FFI::LibZMQ do
  describe ".zmq_errno" do
    it "has function attached" do
      assert_respond_to CZMQ::FFI::LibZMQ, :zmq_errno
    end
  end


  describe ".zmq_strerror" do
    it "has function attached" do
      assert_respond_to CZMQ::FFI::LibZMQ, :zmq_strerror
    end
  end


  describe ".zmq_version" do
    it "has function attached" do
      assert_respond_to CZMQ::FFI::LibZMQ, :zmq_version
    end
  end


  describe ".zmq_has" do
    it "has function attached" do
      assert_respond_to CZMQ::FFI::LibZMQ, :zmq_has
    end
  end


  describe '.has?' do
    let(:return_value) { 0 }

    before do
      allow(CZMQ::FFI::LibZMQ).to receive(:zmq_has).with(FFI::Pointer) { return_value }
    end

    context 'has the capability' do
      let(:return_value) { 1 }

      it "returns true" do
        assert CZMQ::FFI::LibZMQ.has? :foo
      end
    end

    context 'has not the capability' do
      let(:return_value) { 0 }

      it "returns false" do
        refute CZMQ::FFI::LibZMQ.has? :foo
      end
    end
  end


  describe '.has_draft?' do
    it 'returns boolean' do
      assert_includes [true, false], CZMQ::FFI::LibZMQ.has_draft?
    end
  end


  describe '.has_curve?' do
    it 'returns boolean' do
      assert_includes [true, false], CZMQ::FFI::LibZMQ.has_curve?
    end
  end
end
