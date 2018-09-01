(defun reverse1 (w &optional ac)
  (if w (reverse1 (cdr w) (cons (car w) ac)) ac))
(reverse1 '(1 2 3 4 5))