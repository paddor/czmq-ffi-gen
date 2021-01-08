![Specs status](https://github.com/paddor/czmq-ffi-gen/workflows/Specs/badge.svg)

# Generated CZMQ::FFI

This repository is used to package and release the Ruby gem _czmq-ffi-gen_, the
low-level Ruby FFI binding for [CZMQ](https://github.com/zeromq/czmq).  The gem
_czmq-ffi-gen_ can be used as a base for a higher-level CZMQ binding like
[CZTop](https://github.com/paddor/cztop). But of course you can use it for
anything you want. :-)

## Caveats

### Not Ruby-like
This is generated code. It is generated from the API models in CZMQ using
[zproject](https://github.com/zeromq/zproject). It doesn't feel like Ruby. It's
not intended to be used directly. Instead, use
[CZTop](https://gitlab.com/paddor/cztop), or write your own wrapper for this
library.

### Generated code isn't actually in this repository
The actual generated code lies in CZMQ, which is a Git submodule of this
repository, registered under `vendor/czmq`. So if you're not happy with any of
the generated code, go have a closer look at
[CZMQ](https://github.com/zeromq/czmq) (or
[zproject](https://github.com/zeromq/zproject), which is used by CZMQ to
generate the low-level binding).

### API Documentation
For that same reason, API documentation of unreleased code (directly off this
repository), like
[rubydoc.info/github/paddor/czmq-ffi-gen](http://www.rubydoc.info/gitlab/paddor/czmq-ffi-gen)
**does NOT include any of the generated code**. _Rubydoc.info_ doesn't check
out Git submodules as part of its documentation procedure.

However, the API documentation of the **released** gem should include all the
code, as the gem release process will include all required source files
directly within the gem.

Check out
[http://www.rubydoc.info/gems/czmq-ffi-gen](http://www.rubydoc.info/gems/czmq-ffi-gen)
for the API documentation **for the released gem**.

## Requirements

* CZMQ >= 4.2
* ZMQ >= 4.3

On macOS using Homebrew, run:

    $ brew install czmq


## Installation

To use this gem, add this line to your application's Gemfile:

```ruby
gem 'czmq-ffi-gen'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install czmq-ffi-gen

## Usage

Check out [CZTop](https://gitlab.com/paddor/cztop) or the API documentation to
see how this project can be used. :-)

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run
`rake spec` to run the tests. You can also run `bin/console` for an interactive
prompt that will allow you to experiment.

## License

The gem is available as open source under the terms of the [ISC
License](http://opensource.org/licenses/ISC).  See the
[LICENSE](https://gitlab.com/paddor/cztop/blob/master/LICENSE) file.
