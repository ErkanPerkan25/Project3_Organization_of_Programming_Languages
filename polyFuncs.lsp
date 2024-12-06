; Author: Eric Hansson
; Date: 12/6/2024
; Purpose: To calculate polynomials coefficent, degree,
; calculate polynomials, and to evaluate polynomials

; Returns the coefficent of a term
(defun coeff (term)
    (car term)
)

; Return the degree of a term
(defun degree (term)
    (cadr term)
)

; Negates a term
(defun negTerm (term)
    (list (- (coeff term)) (cadr term) )
)

; Compares two terms, if first term is bigger than 
(defun compareTerms (term1 term2)
    (cond
      (t (> (cadr term1) (cadr term2) ) t)
    )
)
; Adds two terms together
(defun addTerms (term1 term2)
    (cond
        ; If the terms have the same degree, add the coefficents and keep the degree
        ((= (degree term1) (degree term2) ) (list (+ (coeff term1) (coeff term2)) (degree term1) ) )
        ; if the terms have different degrees, return both of them
        ( (sort (list term1  term2 ) 'howToCompare) )
    )
)

; Multiplie two terms together
(defun mulTerms (term1 term2)
    ; Multiplies the coefficents, and adds the degrees
    (list (* (car term1) (car term2)) (+ (cadr term1) (cadr term2)) )

)

; Helper functions for sorting
(defun howToCompare (l1 l2)
    ; if the first term is bigger than the second one
    (> (cadr l1) (cadr l2))
)

; Helper function to remove all the terms that have the coefficent of zero
(defun removeZeros (myPoly)
    (cond
        ( (null myPoly) nil)
        ( (> (coeff (car myPoly)) 0) (cons (car myPoly) (removeZeros (cdr myPoly) ) ) ) 
        ( (< (coeff (car myPoly)) 0) (cons (car myPoly) (removeZeros (cdr myPoly) ) ) ) 
        ( (removeZeros(cdr myPoly)) )
    )
)

; Helper functions to combine terms for normalizing
(defun combineTerms (myPoly)
    (cond
        ; if list empty, return nil
        ( (null myPoly) nil) 
        ; if last item, return last item
        ( (null (cdr myPoly)) myPoly)
        ;can add
        ( (= (degree (car myPoly)) (degree (cadr myPoly)) ) (combineTerms (cons (addTerms (car myPoly) (cadr myPoly)) (cddr myPoly)) ) ) 
        ; cannot add
        ( (cons (car myPoly) (combineTerms (cdr myPoly))) )
    )
)

; Normalizes a polynomial
(defun normalize (myPoly)
    ; sorts the polynomial, then combines terms together, and then removes and terms with coefficent zero
    (removeZeros (combineTerms  (sort myPoly 'howToCompare) ) )
)

; Negate a polynomial
(defun negPoly (myPoly)
    (cond
        ; if poly empty, return nil
        ( (null myPoly) nil) 
        ; otherwise negate the polynomial
        ( (normalize myPoly) (normalize(cons (negTerm (car myPoly) ) (negPoly (cdr myPoly))) ) )
    )
)

; Adds two polynomials together to one
(defun addPolys (myPoly1 myPoly2)
    (cond
        ; if either polynomial is empty, return nil
        ( (null myPoly1) nil )
        ( (null myPoly2) nil )
        ; otherwise add the polynomials
        ( (normalize (append myPoly1 myPoly2) ) )
    )
)

; Subtracts two polynomials
(defun subPolys (myPoly1 myPoly2)
    (cond
        ; if either polynomial is empty, return nil
        ( (null myPoly1) nil )
        ( (null myPoly2) nil )
        ; otherwise subtract the polynomials
        ( (normalize (append myPoly1 (negPoly myPoly2) ) ) )
    )
)

; Helper function to foil for multiplying two polynomials
(defun foil (term myPoly)
    (cond
        ; if polynomial is empty, return nil
        ( (null myPoly) nil)
        ; otherwise multiply the term with the other polynomial
        (t (cons (mulTerms term (car myPoly)) (foil term (cdr myPoly)) ) ) 
    )
)

; Multiplies two polynomials
(defun mulPolys (myPoly1 myPoly2)
    (cond
        ; if either polynomial is empty, return nil
        ( (null myPoly1) nil)
        ( (null myPoly2) nil)
        ; otherwise multiply the two polynomials together, and return the result
        (t (normalize (append (foil (car myPoly1) myPoly2) (mulPolys (cdr myPoly1) myPoly2))) )
    )
)

; Helper functions to evaluate the variable (num) with the degree
(defun evaluateDegree (myDegree num)
    (cond
        ; if the degree is 0, the result is 1
        ((= 0 myDegree) 1) 
        ; otherwise calculate the result
        (t (* num (evaluateDegree (- myDegree 1) num) )  )
    )
)

; Helper function that evaluates a term
(defun evaluateTerm (term num)
    (cond
        ; if the term is empyt, return nil
        ( (null term) nil)
        ; otherwise calculate by multiplying the coefficent and the result from evaluateDegree
        (t (* (evaluateDegree (degree term) num) (coeff term)) )
    )
)

; Evaluates a polynomial with the provided number
(defun evalPoly (poly num)
    (cond
        ; if the polynomial is empty, return nil
        ( (null poly) nil)
        ; if it is the last term, calculate it
        ( (null (cdr poly)) (evaluateTerm (car poly) num))
        ; otherwise calculate all the terms and sum them up
        (t (+ (evaluateTerm (car poly) num) (evalPoly (cdr poly) num)) )
    )
     
)
