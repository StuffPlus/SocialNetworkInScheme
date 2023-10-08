;; Done

(module sn-utils racket
(require racket/string) 
  (provide sn-dict-ks-vs
           sn-line->entry
           sn-list->dict
           )

  ;; [(a,b)] -> [(a,b)] 
  ;; Easy
  (define (sn-list->dict es)
    es) ;; As the pairs are already being created in the command all the code has to do is return the list
  
  ;; utils
  ;; [k] [v] -> [(k,v)]
  ;; Easy
  (define (sn-dict-ks-vs ks vs)
    (if (or (null? ks) (null? vs)) ;; check if the key list is empty or the value list is empty
      (display "Invalid input")  ;; if empty return invalid input
       (map cons ks vs))) ;;  we can construct a dictionary by applying the key and the value using the map function

   ;; Medium
  ;; str -> (a,[a])
 (define (sn-line->entry ln);; Using the string split function this splits a string using the whitespace as the delimiter
  (map string->symbol (string-split ln))) ;; Using the map function we can use string->symbol on each of the values in the string-split list

 ) 