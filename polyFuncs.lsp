(defun coeff (term)
    (car term)
)

(defun degree (term)
    (cadr term)
)

(defun negTerm (term)
    (list (- (coeff term)) (cadr term) )
)

(defun compareTerms (term1 term2)
    (cond
      ((> (cadr term1) (cadr term2) ) t)
    )
)

(defun addTerms (term1 term2)
    (cond
        ((= (degree term1) (degree term2) ) (list (+ (coeff term1) (coeff term2)) (degree term1) ) )
        ( (sort (list term1  term2 ) 'howToCompare) )
    )
)

(defun mulTerms (term1 term2)
    (cons (* (car term1) (car term2)) (cons (+ (cadr term1) (cadr term2)) ()) )

)

(defun howToCompare (l1 l2)
    (> (cadr l1) (cadr l2))
)

(defun removeZeros (myPoly)
    (cond
        ( (null myPoly) nil)
        ( (> (coeff (car myPoly)) 0) (cons (car myPoly) (removeZeros (cdr myPoly) ) ) ) 
        ( (< (coeff (car myPoly)) 0) (cons (car myPoly) (removeZeros (cdr myPoly) ) ) ) 
        ( (removeZeros(cdr myPoly)) )
    )
)


(defun combineTerms (myPoly)
    (cond
        ( (null myPoly) nil) 
        ( (null (cdr myPoly)) myPoly)
        ;can add
        ( (= (degree (car myPoly)) (degree (cadr myPoly)) ) (combineTerms (cons (addTerms (car myPoly) (cadr myPoly)) (cddr myPoly)) ) ) 
        ; cannot add
        ( (cons (car myPoly) (combineTerms (cdr myPoly))) )
    )
)


(defun normalize (myPoly)
    (removeZeros (combineTerms  (sort myPoly 'howToCompare) ) )
)

(defun negPoly (myPoly)
    (cond
        ( (null myPoly) nil) 
        ( (normalize myPoly) (normalize(cons (negTerm (car myPoly) ) (negPoly (cdr myPoly))) ) )
    )
)

(defun addPolys (myPoly1 myPoly2)
    (cond
        ( (null myPoly1) nil )
        ( (null myPoly2) nil )
        ( (normalize (append myPoly1 myPoly2) ) )
    )
)

(defun subPolys (myPoly1 myPoly2)
    (cond
        ( (null myPoly1) nil )
        ( (null myPoly2) nil )
        ( (normalize (append myPoly1 (negPoly myPoly2) ) ) )
    )
)

(defun mulPolys (myPoly1 myPoly2)
    (cond
        ( (null myPoly1) nil)
        ( (null myPoly2) nil)
        ( () )
    )
)

(defun evalPolys (poly num)
)
