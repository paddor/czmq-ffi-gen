require_relative "spec_helper"

describe CZMQ::FFI::Zfile do
  include_examples "a zclass"

  context "with a zobj" do
    let(:filename) { "foobar" }
    let(:path) { nil}
    let(:zobj) { described_class.new(path, filename) }
    let(:use_pointer) { zobj.modified }
    include_examples "a zobj"
  end
end
