; The Little Schemer
; Chapter 1: Toys


; Is it true that the following are atoms?

'atom   ; Yes, because atom is a string of characters
'turkey ; Yes, because turkey is a string of characters
'1942   ; Yes, because 1492 is a string of digits
'u      ; Yes, because u is a string of one character
'*abc$  ; Yes, because *abc$ is a string of characters beginning with a special character other than parenthesis

; Is it true that the following are lists

'(atom)  ; Yes, because it is an atom enclosed in parenthesis
'(atom turkey or)  ; Yes, because it is a collection of atoms enclosed by parenthesis
'(atom turkey) or  ; Yes, because these are two S-expressions not enclosed by parenthesis
'((atom turkey) or) ; Yes, because the two S-expressions are now enclosed by parenthesis


; Is it true the the following are S-expressions?

'xyz       ; Yes, because all atoms are S-expressions
'(x y z)   ; Yes, because it is a list
'((x y) z) ; Yes, because all lists are S-expressions


; Is it true that this is a list
'(how are you doing so far) ; Yes, because it is a collection of S-expressions enclosed by parenthesis

; How many S-expressions are in the list, and what are they
'(how are you doing so far)  ; six, how are you doing so far

; Is it true that this is a list
'(((how) are) ((you) (doing so)) far) ; yes, because it is a collection of S-expressions enclosed by parenthesis

; How many S-expressions are in the list and what are they
'(((how) are) ((you) (doing so)) far) ; three, ((how) are)  ((you) (doing so))  and far

; Is this a list?
`()   ; Yes, because it contains zero S-expressions enclosed by parenthesis

; Is it true that this is an atom?
'()    ; No, because it is a list

; Is it true that this is a list?
'(() () () ()) ; Yes, because is it a collection of S-expressions enclosed by parenthesis

; What is the car of:
; (a b c)
(car '(a b c)) ; a, because it is the first atom in the list

; ((a b c) x y z)
(car '((a b c) x y z))  ; (a b c)

; hotdog
'hotdog ; An atom does not have a car

; ()
'() ; You cannot ask for the car of an empty list

; The Law of Car
; The primitive car is defined only for non-empty lists

; What is the car of (((hotdogs)) (and) (pickle) relish)
(car '(((hotdogs)) (and) (pickle) relish)) ; ((hotdogs)) as it is the first S-expression of the list

; What is (car l) where l is (((hotdogs)) (and) (pickle) relish))
(car '(((hotdogs)) (and) (pickle) relish)) ; ((hotdogs)) because (car l) is another way of asking for the car of l

; What is (car (car l)) where l is (((hotdogs)) (and))
(car (car '(((hotdogs)) (and))))  ;  (hotdogs)

; What is the cdr os l where l is

; (a b c)
(cdr '(a b c)) ; (b c) because it is the list without car

; ((a b c) x y z)
(cdr '((a b c) x y z)) ; (x y z)

; (hamburger)
(cdr '(hamburger))     ; ()

; ((x) t r)
(cdr '((x) t r))       ; (t r)

; hotdogs
'hotdogs               ; You cannot ask for the cdr of an atom

; ()
'()                    ; You cannot ask for the cdr of an empty list


; The law of Cdr
; The primitive cdr is defined only for non-empty lists. The cdr of any non-empty list is always another list
;
; What is
; (car (cdr ((b) (x y) ((c)))))
(car (cdr '((b) (x y) ((c)))))   ; (x y) because ((x y) ((c))) if the cdr of the list, and (x y) is the car of it

; (cdr (cdr ((b) (x y) ((c)))))
(cdr (cdr '((b) (x y) ((c)))))   ; (((c))) because ((x y) ((c))) is the cdr of the list, and (((c))) is its cdr

; (cdr (car (a (b (c)) d)))
(cdr (car '(a (b (c)) d)))       ;  None, as car of the list is an atom (a)

; What does car take as an argument?
; A non empty list

; What does cdr take as an argument?
; A non empty list

; What is the cons of the atom a and the list l where a is peanut and l is (butter and jelly)
(cons 'peanut '(butter and jelly))   ; (peanut butter and jelly) because cons adds an atom to the from of a list

; What is the cons of s and l where s is (banana and) and l is (peanut butter and jelly)
(cons '(banana and) '(peanut butter and jelly))  ; ((banana and) peanut butter and jelly) because cons adds any S-expression to the front of the list

; What is the (cons s l) where s is ((help) this) and l is (is very ((hard) to learn))
(cons '((help) this) '(is very ((hard) to learn)))  ;

; What does cons takes as its arguments?
; Cons takes any S-expression and a list as its arguments

; What is (cons s l ) where s is a and l is ()
(cons 'a '())   ; (a)

; What is (cons s l) where s is (a b c) and l is b
(cons '(a b c) 'b)    ; No answer. The second argument must be a list

; What is (cons s l) where s is a and l is b
(cons 'a 'b)  ; No answer. The second argument must be a list

; The Law of Cons
; The primitive Cons takes two arguments. The second argument to Cons must be a list. The result is a list.

; What is (cons s (car l)) is s is a and l is ((b) c d)
(cons 'a '(car ((b) c d)))    ;  (cons 'a '(b)) -> (a b)

; What is (cons s (cdr l)) where s is a and l is ((b) c d)
(cons 'a '(cdr ((b) c d)))    ;  (cons 'a '(c d)) => (a c d)

; Is it true that the lsit l is the null list where l is ()
(null? ())    ; Yes, because the list is composed of zero S-expressions

; What is (null? (quote ()))
(null? '())   ; True

; Is (null? l) true or false where l is (a b c)
(null? '(a b c))  ; False, because the list is not empty

; Is (null? a) true of false where a is spaghetti
; None. null? can only be asked about lists and Spaghetti is an atom

; The Law of Null
; The primitive of null is defined only for lists
