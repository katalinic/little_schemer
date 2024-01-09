#lang racket

(define add1
  (lambda (n) (+ n 1)))

(define length
  (lambda (lat)
    (if (null? lat) 0
        (add1 (length (cdr lat))))))