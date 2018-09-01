
(defun reverse1 (w &optional ac)
  (if w (reverse1 (cdr w) (cons (car w) ac)) ac))
(defun substring2(a y &optional ac)(
	if (= y 0) 
	(coerce (reverse1 ac) 'string)
	(substring2 (cdr a) (- y 1) (cons (car a) ac))
))
(defun substring1(a x y)
(if (= x 0)
	(substring2 a y )
	(substring1 (cdr a) (- x 1) (- y 1)) 
))
(defun substring(a x y)
	(substring1(coerce a 'list) x y))
(defun remove-substring1 (first second i)
(if 
(>= (length second) (+ i (length first))) 
(if
	(string= first (substring second i (+ i (length first))))
 	(remove-substring1 first (concatenate 'string (substring second 0 i) (substring second (+ i (length first)) (length second))) i)
 	(remove-substring1 first second (+ 1 i)))
second))
(defun remove-substring (first second)  (remove-substring1 first second 0))
(remove-substring "abcd" "12abcd 345 abcd678")