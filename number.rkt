#lang racket

(define atom?
  (lambda (x)
    (and (not (pair? x)) (not (null? x) ))))

(define numbered
  (lambda (aexp)
    (cond
      ((atom? aexp) (number? aexp))
      (else (and (numbered (car aexp)) (numbered (car (cdr (cdr aexp)))))))))

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

; (define value
;   (lambda (aexp)
;     (cond
;       ((atom? aexp) aexp)
;       ((eq? (car (cdr aexp)) 'addn) (addn (value (car aexp)) (value (car (cdr (cdr aexp))))))
;       ((eq? (car (cdr aexp)) 'muln) (muln (value (car aexp)) (value (car (cdr (cdr aexp))))))
;       ((eq? (car (cdr aexp)) 'expn) (expn (value (car aexp)) (value (car (cdr (cdr aexp))))))
;       (else #f))))

(define value
  (lambda (aexp)
    (cond
      ((atom? aexp) aexp)
      ((eq? (car aexp) 'addn) (addn (value (car (cdr aexp))) (value (car (cdr (cdr aexp))))))
      ((eq? (car aexp) 'muln) (muln (value (car (cdr aexp))) (value (car (cdr (cdr aexp))))))
      ((eq? (car aexp) 'expn) (expn (value (car (cdr aexp))) (value (car (cdr (cdr aexp))))))
      (else #f))))