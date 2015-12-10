require_relative "../../../spec_helper"

RSpec.shared_examples "a zclass" do
  describe "selftest" do
    it "passes" do
      described_class.test($VERBOSE) # should abort if tests fail
    end
  end
end

RSpec.shared_examples "a zobj" do
  describe "Ruby boilerplate" do
    describe "#__ptr_give_ref" do # getting pointer by reference
      let!(:ptr_ref) { zobj.__ptr_give_ref } # nullifies pointer

      it "returns pointer" do
        assert_kind_of ::FFI::Pointer, ptr_ref
        refute_operator ptr_ref, :null?
      end

      it "nullifies pointer" do
        assert_operator zobj, :null?
      end

      it "raises when using nullified pointer" do
        assert_raises(described_class::DestroyedError) do
          use_pointer # anything that requires a valid pointer
        end
      end
    end
  end
end
