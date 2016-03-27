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
