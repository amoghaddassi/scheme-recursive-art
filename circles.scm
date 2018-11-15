;draws n circles with inititial radius r
(define (repeat-circle n r)
 (if (= n 1) (circle r)
  (begin
   (circle r)
   (repeat-circle (- n 1) (* r .75)))))

(define (draw)
 (bgcolor (rgb 0 0 .5))
 (color (rgb 1 1 0))
 (repeat-circle 10 100)
 (right 90)
 (repeat-circle 10 100)
 (right 90)
 (repeat-circle 10 100)
 (right 90)
 (repeat-circle 10 100)
 (exitonclick))

(draw)