require_relative "spec_helper"

describe CZMQ::FFI::Zframe do
  include_examples "a zclass"

  context "with a zobj" do
    let(:content) { "foobar" }
    let(:content_size) { content.bytesize }
    let(:zobj) { described_class.new(content, content_size) }
    let(:use_pointer) { zobj.data }
    include_examples "a zobj"

    it "has correct data" do
      assert_equal content, zobj.data.read_string
    end
  end

  context "with empty frame" do
    let(:frame) { described_class.new_empty }
    it "is empty" do
      assert_equal 0, frame.size
    end
  end
end
