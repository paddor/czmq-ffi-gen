require_relative "spec_helper"

describe CZMQ::FFI::Zuuid do
  include_examples "a zclass"

  context "with a zobj" do
    let(:zobj) { described_class.new() }
    let(:use_pointer) { zobj.size }
    include_examples "a zobj"
  end
end
