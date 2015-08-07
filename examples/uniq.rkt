#lang racket

;; Report each unique line from stdin
(define seen (make-hash))

(for ([line (in-lines)])
  (unless (hash-ref seen line #f)
    (displayln line))
  (hash-set! seen line #t))
