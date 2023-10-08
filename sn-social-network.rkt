(module sn-social-network racket

  (provide 
   sn-ff-for
   sn-cmn-frnds-btwn
   sn-cmn-frnds
   sn-frnd-cnt
   sn-frndlst-user
   sn-unfrndlst-user  )

  (require "sn-graph.rkt")
  (require "sn-utils.rkt")
  
  ;; social-network.
  ;; Easy
  ;; [(k,v)]| (u,vu) -> vu
  (define (sn-ff-for graph u1)
    (cdr(assoc u1 graph))) ;; using the assoc function to find the user in the dictionary


  ;; Medium
  ;; [(k,v)]|(u1,f1)|(u2,f2) ->
  ;; f2 & f3
  (define (sn-cmn-frnds-btwn graph u1 u2)
     (let* ((u1-friends (dict-ref graph u1 (lambda () (set)) )) ;; get the list of friends for user 1 by using dict-ref and turn into a set
         ;; if the list is empty return empty set
         (u2-friends (dict-ref graph u2 (lambda () (set)) )) ;; get the list of friends for user 2 by using dict-ref and turn into a set
         ;; if list is empty return empty set
         (common-friends (set-intersect u1-friends u2-friends)))  ; Using set-intersection we can find if there are matches in the sets.
    ;; store in commonn friends
    (set->list common-friends)))  ;; convert the set back into a list

  
  ;; Hard
  (define (sn-frnd-cnt graph)   
     (map (lambda (pair) ;; using the map procedure with the lambda function on each of the values in the dictionary
         (cons (car pair) (length (cdr pair)))) ;; Extracts the car of the pair (the key) and the legnth of the cdr of the pair
          ;;(the number of friends)
       graph))  ;;return the key and the number of friends
  
  ;; pre: length > 0 
  (define (sn-frndlst-user graph)
  (let ((max-user #f) (max-frnds 0)) ;; define max-users as empty and max-count to 0
    (for-each (lambda (graph) ;; loop through the dictionary
                (let ((num-friends (length (cdr graph)))) ;; define number of friends as the length of the list of values associated with the key
                  (when (> num-friends max-frnds) ;; when the length of number of friends is greater than the currrent max-friends
                    (set! max-frnds num-friends) ;; set max friends as the length of the list of friends
                    (set! max-user (car graph))))) ;; set the user found as the key
              graph) ;; if no conditions are met then move on to the next key in the dictionary
    (cons max-user max-frnds))) ;; add the key and the number of friends into a dictionary to be printed to screen


              
          
  ;; pre: length > 0
  (define (sn-unfrndlst-user graph)
    (let ((least-user #f) (least-frnds 10000 )) ;; define least-user as empty and least-frnds as 10000
    (for-each (lambda (graph) ;; loop through the dictionary
                (let ((num-friends (length (cdr graph)))) ;; define number of friends as the length of the list of values associated with the key
                  (when (< num-friends least-frnds) ;; when the length of number of friends is less than the currrent least-friends
                    (set! least-frnds num-friends) ;; set least friends as the length of the list of friends
                    (set! least-user (car graph))))) ;; set the user found as the key
              graph) ;; if no conditions are met then move on to the next key in the dictionary
    (cons least-user least-frnds))) ;; add the key and the number of friends into a dictionary to be printed to screen


  ;; this is for free. Do not mdify (ROM)
  (define (sn-cmn-frnds-ff graph u)
    (let*
        ([keys (sn-users graph)]
         [vals (map
                (lambda (key)
                  (sn-cmn-frnds-btwn graph u key))
                keys)]
         )
      (sn-dict-ks-vs keys vals)))


  ;; this is for free. Do not mdify (ROM)
  (define (sn-cmn-frnds graph )
    (let*
        ([keys (sn-users graph)]
         [vals (map
                (lambda (key)
                  (sn-cmn-frnds-ff graph key))
                keys)]
         )
      (sn-dict-ks-vs keys vals)))

  )

