[![Build Status on Travis CI](https://travis-ci.org/paddor/czmq-ffi-gen.svg?branch=master)](https://travis-ci.org/paddor/czmq-ffi-gen?branch=master)
[![Dependency Status](https://gemnasium.com/paddor/czmq-ffi-gen.svg)](https://gemnasium.com/paddor/czmq-ffi-gen)

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
[CZTop](https://github.com/paddor/cztop), or write your own wrapper for this
library.

### Generated code isn't actually in this repository
The actual generated code lies in CZMQ, which is Git submodule of this
repository, registered under `vendor/czmq`.

So if you're not happy with any of the generated code, go have a closer look at
[CZMQ](https://github.com/zeromq/czmq) (or
[zproject](https://github.com/zeromq/zproject), which is used by CZMQ to
generate the low-level binding).

### API Documentation
For that same reason, API documentation of unreleased code (directly off this
repository), like
[rubydoc.info/github/paddor/czmq-ffi-gen](http://www.rubydoc.info/github/paddor/czmq-ffi-gen)
**does NOT include any of the generated code**. _Rubydoc.info_ doesn't check
out Git submodules as part of its documentation procedure.

However, the API documentation of the **released** gem should include all the
code, as the gem release process will include all required source files
directly within the gem.

Check out
[http://www.rubydoc.info/gems/czmq-ffi-gen](http://www.rubydoc.info/gems/czmq-ffi-gen)
for the API documentation **for the released gem**.

## Requirements

* CZMQ >= 3.0
* ZMQ >= 4.0

For security mechanisms like CURVE, you'll need:
* [libsodium](https://github.com/jedisct1/libsodium)<Paste>

On OSX using homebrew, run:

    $ brew install libsodium
    $ brew install zmq --with-libsodium
    $ brew install czmq --HEAD

If you're running Linux, go check [this page](http://zeromq.org/distro:_start)
to get more help. Make sure to install CZMQ, not only ZMQ.

**Note**: The option `--HEAD` is recommended because this binding is generated
directly from CZMQ's master branch. However, it's not required.

### Supported Rubies

See [.travis.yml](https://github.com/paddor/czmq-ffi-gen/blob/master/.travis.yml)
for a list of Ruby versions against which czmq-ffi-gen is tested.

At the time of writing, these include:

* MRI 2.3, 2.2.4, 2.1.8
* Rubinius (HEAD)
* JRuby 9000 (HEAD)

#### Known NOT to work

* JRuby 1.7.x and MRI < 2.0
  * doesn't work because of the use of the double splat operator (`**opts`)

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

Check out [CZTop](https://github.com/paddor/cztop) or the API documentation to
see how this project can be used. :-)

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run
`rake spec` to run the tests. You can also run `bin/console` for an interactive
prompt that will allow you to experiment.

## License

The gem is available as open source under the terms of the [ISC
License](http://opensource.org/licenses/ISC).  See the
[LICENSE](https://github.com/paddor/cztop/blob/master/LICENSE) file.
