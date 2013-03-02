(define (cube-root-iter guess x)
  (if (good-enough? guess x)
    guess
    (cube-root-iter (improve guess x) x)))

(define (good-enough? guess x)
  (< (abs (- guess (improve guess x))) (/ guess 1000)))

(define (improve y x)
  (/ (+ (/ x
           (* y y))
        (* 2 y))
     3))

(define (cube-root x)
  (cube-root-iter 1.0 x))

(cube-root 27)
