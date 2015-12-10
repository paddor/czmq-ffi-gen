require_relative "spec_helper"

describe CZMQ::FFI::Zlist do
  include_examples "a zclass"

  context "with a zobj" do
    let(:zobj) { described_class.new() }
    let(:use_pointer) { zobj.first }
    include_examples "a zobj"

  end

  context "empty list" do
    let(:zlist) { described_class.new }
    it "has no items" do
      assert_operator zlist.first, :null?
    end
  end
end
