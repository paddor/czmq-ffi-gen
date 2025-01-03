require_relative '../../spec_helper'

describe CZMQ::FFI do
  it 'has a CZMQ library version number' do
    refute_nil CZMQ::FFI::VERSION
    refute_nil CZMQ::FFI::CZMQ_VERSION
    assert_same CZMQ::FFI::CZMQ_VERSION, CZMQ::FFI::VERSION
  end

  it 'is able to load CZMQ' do
    assert_operator CZMQ::FFI, :available?
    # p CZMQ::FFI.ffi_libraries
  end

  it 'has a gem version number' do
    refute_nil CZMQ::FFI::GEM_VERSION
  end

  it 'has a ZMQ library version number' do
    refute_nil CZMQ::FFI::ZMQ_VERSION
    assert_kind_of String, CZMQ::FFI::ZMQ_VERSION
    refute_operator CZMQ::FFI::ZMQ_VERSION, :empty?
    assert_same 3, CZMQ::FFI::ZMQ_VERSION.split(".").map{|n|Integer n}.size
  end
end
