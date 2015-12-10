require_relative "spec_helper"

describe CZMQ::FFI::ZdirPatch do
  include_examples "a zclass"

  # TODO
#  context "with a zobj" do
#    let(:zobj) { described_class.new() }
#    let(:use_pointer) { zobj.print }
#    include_examples "a zobj"
#  end
end
