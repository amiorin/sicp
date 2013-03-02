(define (pt-value row col)
  (if (or (= col 1) (= col row))
    1
    (+ (pt-value (- row 1) (- col 1))
       (pt-value (- row 1) col))))

(pt-value 3 2)
(pt-value 5 2)
(pt-value 5 3)
