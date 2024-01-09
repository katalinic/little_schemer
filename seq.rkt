#lang racket

(define seqL
  (lambda (new old l)
    (cons new (cons old l))))

(define seqR
  (lambda (new old l)
    (cons old (cons new l))))

(define insert-g
  (lambda (seq)
    (lambda (new old lat)
        (cond
        ((null? lat) (quote ()))
        ((eq? (car lat) old) (seq new old (cdr lat)))
        (else (cons (car lat) ((insert-g seq) new old (cdr lat))))))))

(define insert-L (insert-g seqL))
(define insert-R (insert-g seqR))