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

(define tup+
  (lambda (tup1 tup2)
    (cond
      ((null? tup1) tup2)
      ((null? tup2) tup1)
      (else (cons (addn (car tup1) (car tup2)) (tup+ (cdr tup1) (cdr tup2)))))))