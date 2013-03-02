; http://c2.com/cgi/wiki?SicpIterationExercise
;
(define (count-change amount)
  (cc amount 4))
(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (= kinds-of-coins 0)) 0)
        (else (+ (cc amount
                     (- kinds-of-coins 1))
                 (cc (- amount
                        (first-denomination kinds-of-coins))
                     kinds-of-coins)))))
(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 26)))

(count-change 99)

 a1  a2  a3 c1 c2
  0   0 100 10 5
  0   5  95 10 5
  0  10  90 10 5
...
  0 100   0 10 5
 10   0  90 10 5
 10   5  85 10 5
 10  10  80 10 5
...
 10  90   0 10 5
 20   0  80 10 5

(define (cc2 n)
  (define (cc-iter a1 a2 a3 c1 c2 r)
    (display (list a1 a2 a3))
    (cond ((>= a3 c2)
           (cc-iter a1 (+ a2 c2) (- n a1 a2 c2) c1 c2 (+ r 1)))
          ((>= (+ a2 a3) c1)
           (cc-iter (+ a1 c1) 0 (- n a1 c1) c1 c2 (+ r 1)))
          (else r)))
  (cc-iter 0 0 n 10 5 1))

(cc2 100)

a1 a2 a3 a4 c1 c2 c3
75 20  0  5 25 10  5
75 20  5  0 25 10  5
...
75  0 25  0 25 10  5


(define (cc2 n)
  (define (cc-iter a1 a2 a3 a4 c1 c2 c3 r)
    (display (list a1 a2 a3 a4))
    (cond ((>= a4 c3)
           (cc-iter a1 a2 (+ a3 c3) (- n a1 a2 a3 c3) c1 c2 c3 (+ r 1)))
          ((>= (+ a3 a4) c2)
           (cc-iter a1 (+ a2 c2) 0     (- n a1 a2 c2) c1 c2 c3 (+ r 1)))
          ((>= (+ a2 a3 a4) c1)
           (cc-iter (+ a1 c1) 0 0         (- n a1 c1) c1 c2 c3 (+ r 1)))
          (else r)))
  (cc-iter 0 0 0 n 25 10 5 1))

(cc2 100)
