(module srfi-171 ()
  (import scheme)
  (import (chicken base))
  (import (only vector-lib vector->list))
  (import srfi-1)
  (import srfi-69)
  (import (r6rs bytevectors))
  (import (chicken module))
  (import (chicken platform))

  (register-feature! 'srfi-171)

  (export rcons
          reverse-rcons
          rcount
          rany
          revery
          list-transduce
          vector-transduce
          string-transduce
          bytevector-u8-transduce
          port-transduce
          generator-transduce

          tmap
          tfilter
          tremove
          treplace
          tfilter-map
          tdrop
          tdrop-while
          ttake
          ttake-while
          tconcatenate
          tappend-map
          tdelete-neighbor-duplicates
          tdelete-duplicates
          tflatten
          tsegment
          tpartition
          tadd-between
          tenumerate
          tlog)

(include "srfi/srfi-171-meta.scm")
(include "srfi/171-impl.scm"))
