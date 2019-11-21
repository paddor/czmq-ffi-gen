require 'bundler/setup'
require 'rspec'
require_relative '../lib/czmq-ffi-gen'

RSpec.configure do |config|
  config.expect_with :rspec, :minitest

  if ENV['DRAFT_API'] == 'yes'
    warn 'Including specs for DRAFT API.'
  else
    warn 'Excluding specs for DRAFT API. To enable, set DRAFT_API=yes in the environment.'
    config.filter_run_excluding state: :draft
  end

  config.filter_run :focus => true
  config.run_all_when_everything_filtered = true
end

puts "Using CZMQ version #{CZMQ::FFI::CZMQ_VERSION} and ZMQ version #{CZMQ::FFI::ZMQ_VERSION}."
