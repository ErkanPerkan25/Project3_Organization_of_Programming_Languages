# Project3_Organization_of_Programming_Languages

Become familiar with basic LISP programming, strengthening recursive coding skills, building a polynomial calculator

## **Eric Hansson**

- Platform:<br>
Arch Linux

- Details to compile program:<br>
To run this program you have to use the tool `clisp`. Run `clisp` by entering this in the command line: <br>

```
clisp
```
When you are in `clisp` you need to load the file which has all the functions for calculating polynomials: <br>

```
(load "polyFuncs.lsp")
```

- Details to run program: 
These are the functions you can call from the when you have loaded the file in `clisp`: <br>
Example of term: '(3 2) <br>
Example of polynomial: '( (8 5) (7 3) (-8 2) (3.14 1) (42 0) ) <br>

- (coeff term)
- (degree term)
- (negTerm term)
- (compareTerms firstTerm secondTerm)
- (addTerms firstTerm secondTerm)
- (mulTerms firstTerm secondTerm)
- (normalize polynomial)
- (negPoly polynomial)
- (addPolys firstPolynomial secondPolynomial)
- (subPolys firstPolynomial secondPolynomial)
- (mulPolys firstPolynomial secondPolynomial)
- (evalPoly polynomial number)

---

- Any known bugs?
There are no bugs that is known of.

- Overview of solving project:
I worked on each functions one by one. And I would try to draw out and handtrace the different functions to make 
it easier to create the functions. Focus on how to make re-create the functions to work recursively.
