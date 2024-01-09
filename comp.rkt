#lang racket

(define sub1
  (lambda (n) (- n 1)))

(define >
  (lambda (m n)
    (cond
      ((zero? m) #f)
      ((zero? n) #t)
      (else (> (sub1 m) (sub1 n))))))

(define <
  (lambda (m n)
    (cond
      ((zero? n) #f)
      ((zero? m) #t)
      (else (< (sub1 m) (sub1 n))))))

(define =
  (lambda (m n)
    (cond
      ((< m n) #f)
      ((> m n) #f)
      (else #t))))