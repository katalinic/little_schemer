#lang racket

(define sub1
  (lambda (n) (- n 1)))

(define pick
  (lambda (n lat)
    (if (zero? n)
        (car lat)
        (pick (sub1 n) (cdr lat))
        )
    ))

(define rempick
  (lambda (n lat)
    (if (zero? n)
        (cdr lat)
        (cons (car lat) (rempick (sub1 n) (cdr lat)))
        )))