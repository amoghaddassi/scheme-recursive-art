; https://en.wikipedia.org/wiki/Sierpinski_triangle

;draws an equilateral triangle of side length s starting at point (x, y)
(define (triangle x y s)
 (penup)
 (setposition x y)
 (pendown)
 (setheading 30)
 (forward s)
 (setheading 150)
 (forward s)
 (setheading 270)
 (forward s)
 (penup))

;draws a serpinski triangle of side length s with a certain recursion depth
(define (serpinski x y s depth)
 (if (= depth 0) nil
  (begin
   (triangle x y s)
   (serpinski x y (/ s 2) (- depth 1))
   (serpinski (+ x (/ s 4)) (+ y (* .4330127019 s)) (/ s 2) (- depth 1))
   (serpinski (+ x (/ s 2)) y (/ s 2) (- depth 1)))))

(define (draw)
 (speed 10)
 (serpinski -200 -200 400 6)
  (exitonclick))

(draw)