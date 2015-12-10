require_relative "spec_helper"

describe CZMQ::FFI::Zpoller do
  include_examples "a zclass"

  context "with a zobj" do
    let(:zsock) { CZMQ::FFI::Zsock.new_req(nil) }
    let(:zobj) { described_class.new(zsock) }
    let(:use_pointer) { zobj.expired }
    include_examples "a zobj"
  end
end
