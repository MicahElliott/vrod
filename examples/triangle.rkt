#lang racket  ; A picture
(require 2htdp/image)
(let sierpinski ([n 8])
  (cond
    [(zero? n) (triangle 2 'solid 'red)]
    [else (define t (sierpinski (- n 1)))
          (freeze (above t (beside t t)))]))
