(define (expt b n)
  (if (= n 0)
    1
    (* b (expt b (- n 1)))))

(define (expt b n)
  (expt-iter  b n 1))

(define (expt-iter b counter product)
  (if (= counter 0)
    product
    (expt-iter b
               (- counter 1)
               (* b product))))

(expt 2 8)

(define (rember a lat)
  (cond ((null? lat) '())
        ((eq? (car lat) a) (cdr lat))
        (else cons (car lat) (rember a (cdr lat)))))
(rember 'a '(a b c))

(define rember
  (lambda (a lat)
    (cond
      ((null? lat) '())
      (else (rember a (cdr lat))))))

(define truth
  (lambda (x)
    (cond (x #t)
          ((not x) #f))))

(truth #f)

(if '()
  #t
  #f)

(not (not '(#f)))
