require 'bundler/setup'
require 'rspec'
require_relative '../lib/czmq-ffi-gen'

RSpec.configure do |config|
  config.expect_with :minitest
end
