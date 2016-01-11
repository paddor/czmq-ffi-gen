0.5.0 (xx/xx/2016)
-----
* add CZMQ::FFI::ZMQ
  - only to get the last ZMQ error (::error)

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
