require 'bundler/setup'
require 'rspec'
require_relative '../lib/czmq-ffi-gen'

RSpec.configure do |config|
  config.expect_with :rspec, :minitest

  if CZMQ::FFI::LibZMQ.has_draft?
    warn 'Including specs for DRAFT API because the installed ZMQ library is built with the DRAFT API.'
  else
    warn 'Excluding specs for DRAFT API. To enable, compile the ZMQ library with DRAFT API.'
    config.filter_run_excluding state: :draft
  end

  config.filter_run :focus => true
  config.run_all_when_everything_filtered = true
end

puts "Using CZMQ version #{CZMQ::FFI::CZMQ_VERSION} and ZMQ version #{CZMQ::FFI::ZMQ_VERSION}."
