;; Use this space for free use.
;; Nothing here well be marked.
;; You may copy any numbered item
;; for testing in REPL.


(require racket/set)
(require "sn-graph.rkt")
(require "sn-social-network.rkt")
(require "sn-utils.rkt")

(define my-dict
  (list
   (cons 'f1 (list 'f3 'f4))
   (cons 'f2 (list 'f3 'f5))
   (cons 'f3 (list 'f1 'f2 'f5 'f6))
   (cons 'f4 (list 'f1 'f6))
   (cons 'f6 (list 'f3 'f4 'f5))
   (cons 'f0 (list 'f5))
   (cons 'f5 (list 'f0 'f2 'f6 'f3))   ))

;; sn-utils.
;F1.i
(sn-list->dict (list (cons 5 6) (cons 7 8) (cons 9 10)))
;F1.ii
(sn-dict-ks-vs '(k4 k5 k6 k7) '(v4 v5 v6 v7))
;F1.iii
(sn-line->entry "A B C X Y Z")


;; sn-graph.
;F2.i
empty
;F2.ii
(sn-users my-dict)
;F2.iii
(sn-add-user my-dict 'f111)
;F2.iv
(sn-add-frndshp my-dict 'f2 'f6)

;; sn-social-network
;F3.i
(sn-ff-for my-dict 'f3)
;F3.ii
(sn-cmn-frnds-btwn my-dict 'f1 'f6)
;F3.iii
(sn-frnd-cnt my-dict)
;F3.iv
(sn-frndlst-user my-dict)
;F3.v
(sn-unfrndlst-user my-dict)