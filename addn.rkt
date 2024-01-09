#lang racket

(define add1
  (lambda (n) (+ n 1)))

(define sub1
  (lambda (n) (- n 1)))

(define addn
  (lambda (m n)
    (if (zero? n)
        m
        (addn (add1 m) (sub1 n)))))

(define muln
  (lambda (m n)
    (if (zero? n)
        0
        (addn m (muln m (sub1 n))))))

(define expn
  (lambda (m n)
    (if (zero? n)
        1
        (muln m (muln m (sub1 n)))
        )))