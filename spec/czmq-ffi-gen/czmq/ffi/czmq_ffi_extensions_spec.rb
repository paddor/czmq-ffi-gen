require_relative "spec_helper"

describe CZMQ::FFI do
  describe ".has_draft?" do
    it 'returns boolean' do
      assert_includes [true, false], CZMQ::FFI.has_draft?
    end
  end
end
