;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Copyright 2019 Linus Björnstam
;;
;; You may use this code under either the license in the SRFI document or the
;; license below.
;;
;; Permission to use, copy, modify, and/or distribute this software for any
;; purpose with or without fee is hereby granted, provided that the above
;; copyright notice and this permission notice appear in all source copies.
;; The software is provided "as is", without any express or implied warranties.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(define-library (srfi 171)
  (import (scheme base)
          (scheme case-lambda)
          (scheme write)
          (srfi 9)
          (only (scheme vector) vector->list)
          (srfi 69)
          (srfi 171 meta))
  (cond-expand
   (gauche (import (only (gauche base) compose reverse!)))
   (chibi (import (only (srfi 1) fold reverse!))))
  (export rcons reverse-rcons
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

  (cond-expand
    (chibi (begin
             (define (compose . functions)
               (define (make-chain thunk chain)
                 (lambda args
                   (call-with-values (lambda () (apply thunk args)) chain)))
               (if (null? functions)
                   values
                   (fold make-chain (car functions) (cdr functions))))))
    (else (begin)))

  (include "171-impl.scm"))
