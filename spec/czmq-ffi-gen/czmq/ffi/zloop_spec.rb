require_relative "spec_helper"

describe CZMQ::FFI::Zloop do
  include_examples "a zclass"

  context "with a zobj" do
    let(:zobj) { described_class.new() }
    let(:use_pointer) { zobj.set_max_timers(50) }
    include_examples "a zobj"
  end
end
