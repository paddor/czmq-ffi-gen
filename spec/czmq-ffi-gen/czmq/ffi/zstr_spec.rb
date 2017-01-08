require_relative "spec_helper"

describe CZMQ::FFI::Zstr do
  include_examples "a zclass"

  describe ".str", state: :draft do
    let(:string) { described_class.str(source).read_string }
    context "with source" do
      let(:source) { "foobar" }
      it "is copy of source" do
        assert_equal source, string
      end
    end
    context "without source" do
      let(:source) { nil }
      it "is empty" do
        assert_empty string
      end
    end
  end
end
