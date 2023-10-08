;; Done
(module sn-graph racket
  (provide sn-consistent
           sn-empty
           sn-add-user
           sn-users
           sn-add-frndshp
           )

  ;; required libraries. (imported above)
  (require racket/dict)
  (require racket/set)

  
  ; Hard
  (define (sn-consistent p) #t)

  ;; graph
  ;; -> [a]
  ;; Easy (+0.5)
  (define sn-empty'()) ;; return an empty list
   

  ;; Easy
  ;; [(k,v)] -> [u]
  (define (sn-users graph)
     (map car graph)) ;; Display the current dictonary

  
  ;; Hard
  ;; [(k,v)] u -> [(k,v)] | (u,{})
  (define (sn-add-user  graph user)
    (if(assoc user graph)  ;; here we are using the assoc function. this checks if the value alrealy exist inside the dictionary
       ;; assoc returns the first value found in the list that matches the key given
         graph ;; return the dictionary of users unchanged
         (cons(list user) graph))) ;; If the value is not found we can now add it the dictionary
    

  ;; Hard
  ;; [(k,v)]|(u1,f1)|(u2,f2) ->
  ;;  [(k,v)] | (u1,f1+{f2}) | (u2,f2+{f1})
  (define (sn-add-frndshp graph u1 u2)
(let* ((f1-friends (dict-ref graph u1 '())) ;; Retrive the current list of friends for user 1
         (f2-friends (dict-ref graph u2 '())) ;; Get list of friends for user 2
         (new-f1-friends (set-add f1-friends u2)) ;; add friends of user 1 and user 2 into one list
         (new-f2-friends (set-add f2-friends u1)) ;; add friends of user 2 and user 1 into one list
         (new-dict (dict-set graph u1 new-f1-friends)) ;;Update the dictionary with the new friends
         (updated-dict (dict-set new-dict u2 new-f2-friends))) ;; return the updated dictionary
    updated-dict))
       ;; Creates a new dictionary, original one not mutatable

  )