require_relative "spec_helper"

describe CZMQ::FFI::Ztrie do
  include_examples "a zclass"

  context "with a zobj" do
    let(:delimiter) { "," }
    let(:zobj) { described_class.new(delimiter) }
    let(:use_pointer) { zobj.hit_parameter_count }
    include_examples "a zobj"
  end
end
