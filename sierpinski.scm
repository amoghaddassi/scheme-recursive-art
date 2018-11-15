; https://en.wikipedia.org/wiki/Sierpinski_triangle

;draws an equilateral triangle of side length s starting at point (x, y).
(define root3 1.7320508)

(define (triangle x y s)
 (penup)
 (setposition x y)
 (pendown)
 (right 30)
 (forward s)
 (right 120)
 (forward s)
 (right 120)
 (forward s)
 (right 90)
 (penup))

;draws a sinski triangle of side length s with a certain recursion depth.
(define (sierpinski x y s depth)
 (if (= depth 0) nil
  (begin
   (triangle x y s)
   (sierpinski x y (/ s 2) (- depth 1))
   (sierpinski (+ x (/ s 4)) (+ y (* (/ root3 4) s)) (/ s 2) (- depth 1))
   (sierpinski (+ x (/ s 2)) y (/ s 2) (- depth 1)))))

;draws an upside down sierpinski triangle, since I can't figure out a more elegant solution to doing this.
(define (sierpinski-invert x y s depth)
 (if (= depth 0) nil
  (begin
   (triangle x y s)
   (sierpinski-invert x y (/ s 2) (- depth 1))
   (sierpinski-invert (- x (/ s 4)) (- y (* (/ root3 4) s)) (/ s 2) (- depth 1))
   (sierpinski-invert (- x (/ s 2)) y (/ s 2) (- depth 1)))))


;draws a hexagon out of 6 Sierpinski triangles.
(define (hexagon x y s)
 (define depth 3)
 (begin
  (sierpinski x y s depth)
  (sierpinski (+ x (/ s 2)) (+ y (* (/ root3 2) s)) s depth)
  (sierpinski (- x (* s .5)) (+ y (* (/ root3 2) s)) s depth)
  (right 180)
  (sierpinski-invert (+ x s) (+ y (* root3 s)) s depth)
  (sierpinski-invert (+ x (* s 1.5)) (+ y (* (/ root3 2) s)) s depth)
  (sierpinski-invert (+ x (/ s 2)) (+ y (* (/ root3 2) s)) s depth)
  (right 180)))

(define (draw)
 (speed 10)
 (bgcolor (rgb 0 0 .5))
 (color (rgb 1 1 0))
 (hexagon -200 -200 50)
 (hexagon -100 -200 50)
  (exitonclick))

(draw)