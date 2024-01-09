#lang racket

(define firsts
  (lambda (l)
    (if (null? l)
        (quote ())
        (cons (car (car l)) (firsts (cdr l))))))

(define member?
  (lambda (a lat)
    (if (null? lat)
        #f
        (or (eq? a (car lat)) (member? a (cdr lat))))
    ))

(define set?
  (lambda (lat)
    (cond
      ((null? lat) #t)
      ((member? (car lat) (cdr lat)) #f)
      (else (set? (cdr lat))))))

(define fun?
  (lambda (rel)
    (set? (firsts rel))))