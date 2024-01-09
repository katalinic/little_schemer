#lang racket

(define atom?
  (lambda (x)
    (and (not (pair? x)) (not (null? x) ))))

(define lat?
  (lambda (l)
    (if (null? l)
        #t
        (and (atom? (car l)) (lat? (cdr l)))
        ))) 