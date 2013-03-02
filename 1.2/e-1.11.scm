(define (foo n)
  (if (< n 3)
    n
    (+ (foo (- n 1))
       (* 2 (foo (- n 2)))
       (* 3 (foo (- n 3)))))))

(define (foo n)
  (define (foo-iter acc1 acc2 acc3 n)
    (if (= n 0)
      acc1
      (foo-iter acc2
                acc3
                (+ acc3
                   (* 2 acc2)
                   (* 3 acc1))
                (- n 1))))
  (foo-iter 0 1 2 n))

(foo 0)
(foo 1)
(foo 2)
(foo 3)
(foo 4)
(foo 5)
(foo 6)

; 0 1 2 0
;
; 0 1 2 1
; 1 2 4 0
;
; 0 1  2 2
; 1 2  4 1
; 2 4 11 0
;
; 0  1  2 3
; 1  2  4 2
; 2  4 11 1
; 4 11 25 0
