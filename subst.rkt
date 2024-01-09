#lang racket

(define subst
  (lambda (new old lat)
    (cond
      ((null? lat) (quote ()))
      ((eq? (car lat) old) (cons new (cdr lat)))
      (else (cons (car lat) (subst new old (cdr lat)))))))

(define atom?
  (lambda (x)
    (and (not (pair? x)) (not (null? x) ))))

(define subst*
  (lambda (new old l)
    (cond
      ((null? l) (quote ()))
      ((atom? (car l)) (
        cond
        ((eq? old (car l)) (cons new (subst* new old (cdr l))))
        (else (cons (car l) (subst* new old (cdr l))))
      ))
      (else (cons (subst* new old (car l)) (subst* new old (cdr l)))))))