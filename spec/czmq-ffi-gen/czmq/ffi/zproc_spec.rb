require_relative "spec_helper"

describe CZMQ::FFI::Zproc, skip: czmq_function?(:zproc_test) do
  include_examples "a zclass"
end
