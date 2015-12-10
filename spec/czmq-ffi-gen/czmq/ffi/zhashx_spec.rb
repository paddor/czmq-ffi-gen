require_relative "spec_helper"

describe CZMQ::FFI::Zhashx do
  include_examples "a zclass"

  context "with a zobj" do
    let(:key) { "key_foobar" }
    let(:zobj) { described_class.new() }
    let(:use_pointer) { zobj.lookup(key) }
    include_examples "a zobj"
  end
end
