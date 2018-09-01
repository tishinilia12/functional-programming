(defclass cart ()
    ((x :initarg :x :accessor cart-x)
     (y :initarg :y :accessor cart-y)))
(defclass polar ()
    ((r :initarg :r :accessor polar-r)
     (q :initarg :q :accessor polar-q)))
(defmethod print-object ((c cart) stream)
    (format stream "(Cart x ~d y ~d)"
        (cart-x c) (cart-y c)))
(defmethod print-object ((c polar) stream)
    (format stream "(polar x ~d y ~d)"
        (polar-r c) (polar-q c)))
(defmethod cart-x((c polar))(* (polar-r c)(cos (polar-q c))))
(defmethod cart-y((c polar))(* (polar-r c)(sin (polar-q c))))
(defun line2(a b)(
+
(*
(-(cart-x a)(cart-x b))
(-(cart-x a)(cart-x b))
)
(*
(-(cart-y a)(cart-y b))
(-(cart-y a)(cart-y b))
)
))
(defclass triangle ()
 ((vertex1 :initarg :1 :reader vertex1)  
  (vertex2 :initarg :2 :reader vertex2)  
  (vertex3 :initarg :3 :reader vertex3)))
(defmethod print-object ((tri triangle) stream)
  (format stream "[trian ~s ~s ~s]"
          (vertex1 tri) (vertex2 tri) (vertex3 tri)))
(setq tri (make-instance 'triangle
           :1 (make-instance 'cart :x 0 :y 0)
           :2 (make-instance 'polar :r 1 :q 1)
           :3 (make-instance 'cart :x 0 :y 1)))
(setq trian (make-instance 'triangle
           :1 (make-instance 'cart :x 2 :y 1)
           :2 (make-instance 'polar :r 0 :q 0)
           :3 (make-instance 'cart :x -2 :y 1)))
(defun obtuse(tri)(or (and 
            ( <
(+(line2(vertex1 tri)(vertex2 tri))(line2(vertex3 tri)(vertex2 tri)))
(line2(vertex1 tri)(vertex3 tri))) 
            (>(+(sqrt(line2(vertex1 tri)(vertex2 tri)))(sqrt(line2(vertex3 tri)(vertex2 tri))))
(sqrt(line2(vertex1 tri)(vertex3 tri)))))
           (and 
            ( <
(+(line2(vertex1 tri)(vertex3 tri))(line2(vertex3 tri)(vertex2 tri)))
(line2(vertex1 tri)(vertex2 tri))) 
            (>(+(sqrt(line2(vertex1 tri)(vertex3 tri)))(sqrt(line2(vertex3 tri)(vertex2 tri))))
(sqrt(line2(vertex1 tri)(vertex2 tri)))))
           (and 
            ( <
(+(line2(vertex1 tri)(vertex2 tri))(line2(vertex3 tri)(vertex1 tri)))
(line2(vertex2 tri)(vertex3 tri))) 
            (>(+(sqrt(line2(vertex1 tri)(vertex2 tri)))(sqrt(line2(vertex3 tri)(vertex1 tri))))
(sqrt(line2(vertex2 tri)(vertex3 tri)))))
                               )    
)
(obtuse tri)
(obtuse trian)