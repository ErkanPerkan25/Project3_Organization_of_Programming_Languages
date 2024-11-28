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

(defun addTerms ()
)

(defun mulTerms ()
)

(defun normalize ()
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
