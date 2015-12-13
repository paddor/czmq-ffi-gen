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

    describe "#__ptr" do
      it "exists" do
        assert_operator zobj, :respond_to?, :__ptr
      end

    end
    describe "#to_ptr" do
      it "exists" do
        assert_operator zobj, :respond_to?, :to_ptr
      end

      it "is an alias of #__ptr" do
        assert_equal zobj.method(:__ptr), zobj.method(:to_ptr)
      end
    end
    describe "#__undef_finalizer" do
      it "exists" do
        assert_operator zobj, :respond_to?, :__undef_finalizer
      end

    end
    describe ".create_finalizer_for" do
      it "exists" do
        assert_operator described_class, :respond_to?, :create_finalizer_for
      end

    end
    describe "#null?" do
      it "exists" do
        assert_operator zobj, :respond_to?, :null?
      end
    end
  end
end
