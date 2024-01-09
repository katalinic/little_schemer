#lang racket

(define add1
  (lambda (n) (+ n 1)))

(define addn
  (lambda (m n)
    (if (zero? n)
        m
        (addn (add1 m) (sub1 n)))))

(define addtup
  (lambda (tup)
    (if (null? tup)
        0
        (addn (car tup) (addtup (cdr tup))) )))