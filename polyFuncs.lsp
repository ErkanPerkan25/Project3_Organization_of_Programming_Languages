(defun coeff (term)
    (car term)
)

(defun degree (term)
    (cadr term)
)

(defun negTerm (term)
    (- (car term) )
)

(defun compareTerms (term1 term2)
    (cond
      ((> (cadr term1) (cadr term2) ) t)
    )
)

(defun addTerms (term1 term2)
    (cond
        ((= (cadr term1) (cadr term2) ) 
            (cons (+ (car term1) (car term2)) (cons (cadr term1) () ) )
        )
        (
         (cons term1 (cons term2 ()))
        )
    )
)

(defun mulTerms (term1 term2)
    (cons (* (car term1) (car term2)) (cons (+ (cadr term1) (cadr term2)) ()) )
)

(defun howToCompare (l1 l2)
    (> (cadr l1) (cadr l2))
)

(defun normalize (poly)
    (sort poly 'howToCompare)
)

(defun negPoly ()
)

(defun addPolys ()
)

(defun subPolys ()
)

(defun mulPolys ()
)

(defun evalPolys ()
)
