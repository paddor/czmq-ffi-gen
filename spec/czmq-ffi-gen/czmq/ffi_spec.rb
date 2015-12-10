require_relative '../../spec_helper'

describe CZMQ::FFI do
  it 'has a library version number' do
    refute_nil CZMQ::FFI::VERSION
    refute_nil CZMQ::FFI::LIBRARY_VERSION
    assert_same CZMQ::FFI::LIBRARY_VERSION, CZMQ::FFI::VERSION
  end

  it 'has a gem version number' do
    refute_nil CZMQ::FFI::GEM_VERSION
  end
end
