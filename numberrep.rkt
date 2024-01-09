#lang racket

(define sero?
  (lambda (n)
    null? n))

(define edd1
  (lambda (n)
    (cons (quote ()) n)))

(define zub1
  (lambda (n)
    (cdr n)))

(define edd
  (lambda (m n)
    (cond 
    ((sero? n) m)
    (else (edd (edd1 m) (zub1 n)))
    )))