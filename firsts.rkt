#lang racket

(define firsts
  (lambda (l)
    (if (null? l)
        (quote ())
        (cons (car (car l)) (firsts (cdr l))))))