# Generated CZMQ::FFI

This is _czmq-ffi-gen_, the low-level Ruby FFI binding for
[CZMQ](https://github.com/zeromq/czmq). It is generated from the API models in
CZMQ using [zproject](https://github.com/zeromq/zproject). Its main purpose is
to provide a base for the high-level CZMQ binding
[CZTop](https://github.com/paddor/cztop), but of course you can use it for
anything you want.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'czmq-ffi-gen'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install czmq-ffi-gen

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## License

The gem is available as open source under the terms of the [ISC License](http://opensource.org/licenses/ISC).
See the [LICENSE](https://github.com/paddor/cztop/blob/master/LICENSE) file.
