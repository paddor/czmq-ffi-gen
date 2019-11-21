0.16.0 (11/20/2019)
-----
* relax gem dependencies
* update CZMQ low-level binding

0.15.0 (03/04/2018)
-----
* update CZMQ low-level binding to include fixed errno for unsupported features (ENOTSUP)

0.14.1 (11/29/2017)
-----
* update CZMQ low-level binding to include fixes for zmonitor events
  (zeromq/czmq#1806)
* fix building fat binaries for Windows (thanks to Kouhei Sutou)

0.14.0 (11/27/2017)
-----
* on Windows with RubyInstaller2: fix loading libczmq
  (thanks to Christian Boos)
* update CZMQ low-level binding to include the improvements on robustness
  (zeromq/zproject#1010)
* CI: use recent rubies, but don't test MRI 2.1 anymore

0.13.0 (01/01/2017)
-----
* update CZMQ low-level binding to v4.0.2 to fix #7

0.12.0 (11/02/2016)
-----
* update CZMQ low-level binding to v4.0.0

0.11.0 (11/02/2016)
-----
* update CZMQ low-level binding to v4.0.0-rc1

0.10.0 (09/25/2016)
-----
* update CZMQ low-level binding to honor the LIBCZMQ_PATH environment variable
  to set a custom search path for the CZMQ library
* honor the LIBZMQ_PATH environment variable to set a custom search path for
  the ZMQ library

0.9.4 (09/22/2016)
-----
* update CZMQ low-level binding to
  - fix zsock_fd() FFI attachment (and thus CZMQ::FFI::Zsock.fd)

0.9.3 (09/21/2016)
-----
* fix issue with special build types (zeromq/czmq@4acc4ed)
  (thanks to Kouhei Sutou)

0.9.2 (09/19/2016)
-----
* no changes

0.9.1 (09/19/2016)
-----
* no changes, just second try at publishing (publishing of version 0.9.0 failed
  due to human error)

0.9.0 (09/18/2016)
-----
* support building and pushing fat gems for Windows x86 and x64
  (thanks to Kouhei Sutou)
* upgrade CZMQ low-level binding to fix cross compile errors

0.8.3 (03/29/2016)
-----
* avoid extra call to wrapper method CZMQ::FFI::Errors.errno (CZTop's test
  suite doesn't like this)

0.8.2 (03/29/2016)
-----
* fix CZMQ::FFI::Errors.strerror

0.8.1 (03/29/2016)
-----
* provide CZMQ::FFI::ZMQ_VERSION
* rename CZMQ::FFI::LIBRARY_VERSION to CZMQ::FFI::CZMQ_VERSION
* new module CZMQ::FFI::LibZMQ which is the sole place to interact directly
  with the ZMQ library

0.8.0 (03/27/2016)
-----
* upgrade CZMQ low-level binding to
  - fix function names in warnings
  - have constants instead of enums
  - adapt to the new interface of zarmour_encode/decode

0.7.0 (01/21/2016)
-----
* add support for current stable release 3.0.2 of CZMQ
* upgrade CZMQ low-level binding to
  - gracefully handle absent draft functions

0.6.0 (01/15/2016)
-----
* upgrade CZMQ low-level binding to
  - add support for ZMTP 3.1 heartbeat options

0.5.0 (01/14/2016)
-----
* add CZMQ::FFI::Errors
  - hand-written code to interact with libzmq
  - .errno returns error code of last (ZMQ) error
  - .strerror returns string representation of last (ZMQ) error
* upgrade CZMQ low-level binding to
  - add Zchunk

0.4.1 (01/06/2016)
-----
* upgrade CZMQ low-level binding to
  - fix zbeacon so it doesn't close STDIN

0.4.0 (12/26/2015)
-----
* upgrade CZMQ low-level binding to
  - add Zproc.has_curve
* add basic specs for Zproc

0.3.0 (12/15/2015)
-----
* upgrade CZMQ low-level binding to
  - add Zcert#unset_meta

0.2.1 (12/12/2015)
-----
* upgrade CZMQ low-level binding to
  - allow passing a null pointer (nil) for an FFI :string parameter

0.2.0 (12/10/2015)
-----
* using new CZMQ version which
  - fixes some security issues
  - adds Zcert and Zcertstore
* basic specs for each Zclass added

0.1.1 (12/09/2015)
-----
* include some auxiliary files like CHANGES.md, LICENSE, and README.md into gem

0.1.0 (12/09/2015)
-----
* Initial release
