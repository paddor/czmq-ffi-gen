require_relative "spec_helper"

describe CZMQ::FFI::Zsock do
  include_examples "a zclass"

  context "with a zsock" do
    i = 0
    let(:endpoint)    { "inproc://endpoint_#{i+=1}" }
    let(:zobj)        { described_class.new_pair(endpoint) }
    let(:use_pointer) { zobj.endpoint }

    include_examples "a zobj"

    it "creates REP Zsock" do
      sock = described_class.new_rep(endpoint)
      refute_operator sock, :null?
    end

    it "creates REQ Zsock" do
      sock = described_class.new_req(endpoint)
      refute_operator sock, :null?
    end
  end
end
