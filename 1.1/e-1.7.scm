(define (sqrt-iter guess x)
  (if (good-enough? guess x)
    guess
    (sqrt-iter (improve guess x) x))))

(define (good-enough? guess x)
;  (display (improve guess x))
;  (newline)
  (< (abs (- guess (improve guess x))) (/ guess 1000)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (square x)
  (* x x))

(define (sqrt x)
  (sqrt-iter (/ x 2.0) x))

(sqrt 10000000000000)
(sqrt 0.0005)
(sqrt 1)
