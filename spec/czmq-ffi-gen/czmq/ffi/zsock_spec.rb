require_relative "spec_helper"

describe CZMQ::FFI::Zsock do
  context "with a zsock" do
    i = 0
    let(:endpoint) { "inproc://endpoint_#{i+=1}" }
    let(:zobj) { described_class.new_pair(endpoint) }
    let(:use_pointer) { zobj.endpoint }
    include_examples "a zclass"
  end
end
