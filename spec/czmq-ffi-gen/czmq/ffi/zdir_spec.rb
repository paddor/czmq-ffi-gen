require_relative "spec_helper"

describe CZMQ::FFI::Zdir do
  include_examples "a zclass"

  context "with a zobj" do
    let(:zobj) { described_class.new(".", "-") }
    let(:use_pointer) { zobj.path }
    include_examples "a zobj"
  end
end
