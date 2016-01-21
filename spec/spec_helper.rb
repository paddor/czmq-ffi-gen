require 'bundler/setup'
require 'rspec'
require_relative 'czmq_helper'
require_relative '../lib/czmq-ffi-gen'

RSpec.configure do |config|
  config.expect_with :minitest
  include CZMQHelper
end
